import test from "node:test";
import { getContainer } from "./container-script.js";

test("should assign github to projects", (t) => {
	const container = getContainer(
		new URL("https://github.com/build-great-products/rough.app"),
	);
	t.assert.equal(container, "projects");
});

test("should assign github.com/Runn-Fast/ to george@runn.io", (t) => {
	const container = getContainer(new URL("https://github.com/Runn-Fast/runn"));
	t.assert.equal(container, "george@runn.io");
});

test("should skip github.com/session/", (t) => {
	const container = getContainer(new URL("https://github.com/session/"));
	t.assert.equal(container, undefined);
});

test("should assign linear.app to projects", (t) => {
	const container = getContainer(new URL("https://linear.app"));
	t.assert.equal(container, "projects");
});

test("should assign linear.app/ to projects", (t) => {
	const container = getContainer(new URL("https://linear.app/"));
	t.assert.equal(container, "projects");
});

test("should assign linear.app/runn/ to george@runn.io", (t) => {
	const container = getContainer(new URL("https://linear.app/runn/"));
	t.assert.equal(container, "george@runn.io");
});
