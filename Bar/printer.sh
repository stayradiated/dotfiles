#! /bin/sh

# Takes the input from reader and returns the formatted output

# Bar Colours
# 0 = background
# 1 = foreground
# 2 = grey bg
# 3 = grey text
# 4 = red
# 5 = green
# 6 = orange
# 7 = yellow
# 8 = blue
# 9 = magenta

# Icons
bat=$(echo -e '\ue006') # battery
clk=$(echo -e '\ue00e') # clock

# Tags
zsh='ZSH'
web='WEB'
dev='DEV'
irc='IRC'
fun='FUN'

# Tags
tags=("" "ZSH" "WEB" "DEV" "IRC" "MSC")

battery=""
time=""


function print_right () {
  right="\r\f1${essid}  \f3${bat} \f1${battery}% \f3${clk} \f1${time}\fr "
}

function print_title () {
  title="\c${line#?}"
}

function print_left () {
  left=""
  IFS=':'
  set -- ${line#?}
  while [ $# -gt 0 ] ; do
    item=$1
    id=${item#?}
    name="  ${tags[$id]}  "
    case $item in
      u*)
        # urgent desktop
        left="$left\\b2\\f0${name}\\fr\\br"
        ;;
      [DU][0-9])
        # active desktop
        left="$left\\u5\\b2\\f5${name}\\fr\\br\\ur"
        ;;
      d*)
        # inactive but occupied desktop
        left="$left\\u2\\f1${name}\\fr\\ur"
        ;;
      E*)
        # inactive desktop
        left="$left\\f3${name}\\fr"
        ;;
      L*)
        # layout
        layout=$(printf "%s" "${id}" | sed 's/\(.\).*/\U\1/')
        left="$left \\f6[ $layout ]\\fr"
        ;;
    esac
    shift
  done
}
