
PREFIX = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">"""
SUFFIX = "</plist>"

DICT = ["<dict>", "</dict>"]
KEY = ["<key>", "</key>"]
REAL = ["<real>", "</real>"]
NL = "\n"

COMPONENTS = ["Red Component", "Green Component", "Blue Component"]

REGEX_COMMENT = /^!/
REGEX_URXVT = /^(urxvt\.|\*)/
REGEX_DEFINE = /^#define\s+(\w+)\s+#(\w+)$/
REGEX_COLOR = /color(\d+):\s+#?(\w*)$/
REGEX_SPECIAL = /(background|foreground):\s+#?(\w*)$/

HOME = process.env.HOME
XRESOURCES_PATH = process.argv[2] or "#{ HOME }/.Xresources"

fs = require 'fs'

colors = {}
definitions = {}

hexToPercent = (hex) ->
  parseInt(hex, 16) / 256

hexToArray = (hex) ->
  return [
    hexToPercent(hex[0..1]),
    hexToPercent(hex[2..3]),
    hexToPercent(hex[4..5])
  ]

getName = (id) ->
  names = ['Current Line', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white',
           'Selection', 'b_red', 'b_green', 'b_yellow', 'b_blue', 'b_magenta', 'b_cyan', 'b_white']
  return names[id] or id

fs.readFile XRESOURCES_PATH, (err, data) ->
  if err then throw err
  lines = data.toString().split('\n')

  for line in lines
    if line.match(REGEX_COMMENT) or not line.match(REGEX_URXVT)
      continue


    if match = line.match(REGEX_COLOR)
      [string, id, color] = match
      colors[id] = color

    else if match = line.match(REGEX_SPECIAL)
      [string, id, color] = match
      id = id[0].toUpperCase() + id[1..].toLowerCase()
      colors[id] = color

    else if match = line.match(REGEX_DEFINE)
      [string, id, color] = match
      definitions[id] = color

  output = PREFIX + NL
  output += DICT[0] + NL

  for id, color of colors
    if definitions.hasOwnProperty(color)
      color = colors[id] = definitions[color]

    real = hexToArray(color)

    if id.match(/\d+/)
      name = "Ansi #{id} Color" 
    else
      name = "#{id} Color"

    output += KEY[0] + name + KEY[1] + NL
    output += DICT[0] + NL
    output += KEY[0] + COMPONENTS[0] + KEY[1] + NL
    output += REAL[0] + real[0] + REAL[1] + NL
    output += KEY[0] + COMPONENTS[1] + KEY[1] + NL
    output += REAL[0] + real[1] + REAL[1] + NL
    output += KEY[0] + COMPONENTS[2] + KEY[1] + NL
    output += REAL[0] + real[2] + REAL[1] + NL
    output += DICT[1] + NL

  output += DICT[1] + NL
  output += SUFFIX

  console.log output
