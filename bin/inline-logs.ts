#!/usr/bin/env -S node
// vim: set ft=typescript:

import { spawnSync } from "node:child_process";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { pathToFileURL } from "node:url";

type InlineLogEntry = {
  file: string;      // absolute path
  line: number;      // 1-based
  col: number;       // 1-based
  text: string;      // formatted output (may be multi-line)
};

function usageAndExit(code = 1) {
  console.error(
    [
      "Usage:",
      "  inline-logs [options] <entry-file> [args...]",
      "",
      "Examples:",
      "  inline-logs ./src/1-people-atom.ts",
      "  inline-logs ./src/1-people-atom.ts --foo bar",
      "",
      "Options:",
      "  --max <n>        Max captured outputs per callsite line (default: 10)",
      "  --prefer-json    When console.log has exactly 1 arg that looks JSON-safe, store JSON.stringify(arg, null, 2)",
    ].join("\n")
  );
  process.exit(code);
}

function parseOptions(toolArgs: string[]) {
  let maxPerLine = 10;
  let preferJson = false;

  for (let i = 0; i < toolArgs.length; i++) {
    const a = toolArgs[i];
    if (a === "--max") {
      const v = toolArgs[i + 1];
      if (!v) usageAndExit(1);
      maxPerLine = Number(v);
      if (!Number.isFinite(maxPerLine) || maxPerLine < 1) {
        console.error("--max must be a positive number");
        process.exit(1);
      }
      i++;
    } else if (a === "--prefer-json") {
      preferJson = true;
    } else {
      console.error(`Unknown option: ${a}`);
      usageAndExit(1);
    }
  }

  return { maxPerLine, preferJson };
}

function detectEol(s: string) {
  return s.includes("\r\n") ? "\r\n" : "\n";
}

function escapeCommentBodyLine(line: string) {
  // Prevent accidentally closing the block comment.
  return line.replaceAll("*/", "*\\/");
}

function makeInlineBlock(indent: string, lines: string[]) {
  const body = lines.length ? lines : ["(no output)"];
  const escaped = body.map(escapeCommentBodyLine);
  const out: string[] = [];
  out.push(`${indent}/*`);
  for (const l of escaped) out.push(`${indent} * ${l}`);
  out.push(`${indent} */`);
  return out;
}

function isConsoleLogLine(line: string) {
  // Simple heuristic; good enough for "blog code" patterns.
  return /\bconsole\.log\s*\(/.test(line);
}

function removeExistingInlineBlock(lines: string[], startIdx: number) {
  // If lines[startIdx] is `/*`, remove until closing `*/`.
  if (startIdx >= lines.length) return { removed: false, nextIdx: startIdx };
  if (!/^\s*\/\*$/.test(lines[startIdx])) {
    return { removed: false, nextIdx: startIdx };
  }
  let i = startIdx;
  while (i < lines.length) {
    const l = lines[i];
    i++;
    if (/\*\//.test(l)) break;
  }
  lines.splice(startIdx, i - startIdx);
  return { removed: true, nextIdx: startIdx };
}

function buildRunnerSource() {
  // ESM runner (written to a .mjs temp file)
  // It patches console.log, records entries, then imports the target module.
  return `
import fs from "node:fs";
import util from "node:util";
import path from "node:path";
import { pathToFileURL, fileURLToPath } from "node:url";

const outPath = process.env.INLINE_LOG_OUT;
const targetAbs = process.env.INLINE_LOG_TARGET;
const preferJson = process.env.INLINE_LOG_PREFER_JSON === "1";

if (!outPath || !targetAbs) {
  console.error("inline runner missing env vars");
  process.exit(1);
}

const entries = [];

function normalizeToPath(maybeUrlOrPath) {
  try {
    if (maybeUrlOrPath.startsWith("file://")) return fileURLToPath(maybeUrlOrPath);
  } catch {}
  return maybeUrlOrPath;
}

function parseCallsiteLine(stackLine) {
  // Handles:
  //   at file:///.../x.ts:12:3
  //   at fn (file:///.../x.ts:12:3)
  //   at fn (/abs/x.ts:12:3)
  //   at /abs/x.ts:12:3
  const m =
    stackLine.match(/\\((.+?):(\\d+):(\\d+)\\)\\s*$/) ||
    stackLine.match(/\\s(at\\s+)?(.+?):(\\d+):(\\d+)\\s*$/);
  if (!m) return null;

  // If we matched the second regex, groups differ
  let filePart, lineStr, colStr;
  if (m.length === 4) {
    // (file:line:col)
    filePart = m[1];
    lineStr = m[2];
    colStr = m[3];
  } else {
    // ... file:line:col
    filePart = m[m.length - 3];
    lineStr = m[m.length - 2];
    colStr = m[m.length - 1];
  }

  const file = normalizeToPath(filePart);
  const line = Number(lineStr);
  const col = Number(colStr);
  if (!Number.isFinite(line) || !Number.isFinite(col)) return null;
  return { file, line, col };
}

function getTargetCallsite() {
  const err = new Error();
  const stack = (err.stack || "").split("\\n").slice(1);
  for (const s of stack) {
    const parsed = parseCallsiteLine(s.trim());
    if (!parsed) continue;
    // Choose the first frame that points at the target file
    if (path.resolve(parsed.file) === path.resolve(targetAbs)) return parsed;
  }
  return null;
}

function isJsonSafe(x) {
  if (x === null) return true;
  const t = typeof x;
  if (t === "string" || t === "number" || t === "boolean") return true;
  if (Array.isArray(x)) return x.every(isJsonSafe);
  if (t === "object") {
    // plain-ish object
    for (const k of Object.keys(x)) {
      if (!isJsonSafe(x[k])) return false;
    }
    return true;
  }
  return false;
}

function formatArgs(args) {
  if (preferJson && args.length === 1 && isJsonSafe(args[0])) {
    try { return JSON.stringify(args[0], null, 2); } catch {}
  }
  // Similar to console.log formatting, but deterministic (no colors)
  return util.format(...args);
}

const origLog = console.log.bind(console);
console.log = (...args) => {
  const cs = getTargetCallsite();
  const text = formatArgs(args);
  if (cs) {
    entries.push({ file: path.resolve(cs.file), line: cs.line, col: cs.col, text });
  }
  origLog(...args);
};

function writeOut() {
  try {
    fs.writeFileSync(outPath, JSON.stringify(entries, null, 2), "utf8");
  } catch (e) {
    // last resort: don't crash on write failure
  }
}

process.on("exit", writeOut);
process.on("uncaughtException", (err) => {
  writeOut();
  throw err;
});

const targetUrl = pathToFileURL(targetAbs).href;

// Mimic argv for the target module (best-effort)
const extra = JSON.parse(process.env.INLINE_LOG_ARGS_JSON || "[]");
process.argv = [process.execPath, targetAbs, ...extra];

await import(targetUrl);
`.trimStart();
}

function rewriteFileWithLogs(params: {
  fileAbs: string;
  entries: InlineLogEntry[];
  maxPerLine: number;
}) {
  const { fileAbs, entries, maxPerLine } = params;

  const original = fs.readFileSync(fileAbs, "utf8");
  const eol = detectEol(original);
  const lines = original.split(/\r?\n/);

  // Collect executed outputs by line (preserve runtime order)
  const byLine = new Map<number, string[]>();
  for (const e of entries) {
    if (path.resolve(e.file) !== path.resolve(fileAbs)) continue;
    if (!Number.isFinite(e.line) || e.line < 1 || e.line > lines.length) continue;

    const arr = byLine.get(e.line) ?? [];
    if (arr.length < maxPerLine) arr.push(e.text);
    byLine.set(e.line, arr);
  }

  let updatedCount = 0;

  // Walk lines and insert blocks under console.log lines that executed
  for (let i = 0; i < lines.length; i++) {
    const lineNo = i + 1;
    const outputs = byLine.get(lineNo);
    if (!outputs || outputs.length === 0) continue;

    const srcLine = lines[i];
    if (!isConsoleLogLine(srcLine)) continue;

    const indent = (srcLine.match(/^(\s*)/)?.[1]) ?? "";

    // Remove an existing generated block immediately below
    removeExistingInlineBlock(lines, i + 1);

    // If multiple outputs, include them all separated
    const blockBody: string[] = [];
    if (outputs.length === 1) {
      blockBody.push(...outputs[0].split(/\r?\n/));
    } else {
      for (let k = 0; k < outputs.length; k++) {
        blockBody.push(...outputs[k].split(/\r?\n/));
      }
    }

    const block = makeInlineBlock(indent, blockBody);
    lines.splice(i + 1, 0, ...block);

    updatedCount++;
    i += block.length; // skip over inserted block
  }

  const next = lines.join(eol);
  if (next !== original) fs.writeFileSync(fileAbs, next, "utf8");

  return { updatedCount, changed: next !== original };
}

function main() {
  const [ entry, ...toolArgs ] = process.argv.slice(2)
  const { maxPerLine, preferJson } = parseOptions(toolArgs);

  if (!entry) {
    usageAndExit(1);
  }

  const entryAbs = path.resolve(process.cwd(), entry);
  if (!fs.existsSync(entryAbs)) {
    console.error(`Entry file not found: ${entryAbs}`);
    process.exit(1);
  }

  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "inline-logs-"));
  const runnerPath = path.join(tmpDir, "inline-runner.mjs");
  const outPath = path.join(tmpDir, "inline-logs.json");

  fs.writeFileSync(runnerPath, buildRunnerSource(), "utf8");

  const env = {
    ...process.env,
    INLINE_LOG_OUT: outPath,
    INLINE_LOG_TARGET: entryAbs,
    INLINE_LOG_PREFER_JSON: preferJson ? "1" : "0",
  };

  // Run: node <runner.mjs>
  const res = spawnSync(process.execPath, [runnerPath], {
    stdio: "inherit",
    env,
  });

  // Even if the program exited non-zero, try to inline whatever was captured
  let entries: InlineLogEntry[] = [];
  try {
    const raw = fs.readFileSync(outPath, "utf8");
    entries = JSON.parse(raw);
  } catch {
    // no entries captured
  }

  const { updatedCount, changed } = rewriteFileWithLogs({
    fileAbs: entryAbs,
    entries,
    maxPerLine,
  });

  // Cleanup temp dir best-effort
  try {
    fs.rmSync(tmpDir, { recursive: true, force: true });
  } catch {}

  console.error(
    changed
      ? `✅ Inlined ${updatedCount} console.log output block(s) into ${path.relative(process.cwd(), entryAbs)}`
      : `ℹ️ No changes made to ${path.relative(process.cwd(), entryAbs)}`
  );

  process.exit(res.status ?? (res.error ? 1 : 0));
}

main();
