#! /bin/sh

source $(dirname $0)/printer.sh

while read -r line ; do
  case $line in
    X*)
      essid="${line#?}"
      print_right
      ;;
    B*)
      battery="${line#?}"
      print_right
      ;;
    S*)
      time="${line#?}"
      print_right
      ;;
    T*)
      print_title
      ;;
    W*)
      print_left
      ;;
  esac
  printf "%s\n" "$left $title $right"
done
