#!/bin/bash
scrot /tmp/lock-screen.png
#[[ -f $1 ]] && convert $1 -resize 1920x1080! -blur 0x8 /tmp/lock-screen.png
convert /tmp/lock-screen.png -blur 0x8 /tmp/lock-screen.png
[[ -f $1 ]] && convert /tmp/lock-screen.png $1 -gravity center -composite -matte /tmp/lock-screen.png
i3lock -e -b -i /tmp/lock-screen.png 
rm /tmp/lock-screen.png
sleep 1
exit 0
