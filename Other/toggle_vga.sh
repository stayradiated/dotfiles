#!/bin/bash

IN="LVDS1"
EXT="VGA1"

if (xrandr | grep "$EXT" | grep "+")
then
  xrandr --output $EXT --off --output $IN --auto
else
  if (xrandr | grep "$EXT" | grep " connected")
  then
    xrandr --output $IN --off --output $EXT --auto
  fi
fi


