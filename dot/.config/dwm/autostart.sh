#!/bin/sh

# add your autostart stuffs here
picom &
# xrdb merge ~/Public/xresources/forest/.Xresources &
feh --bg-tile ~/.config/dwm/wallpaper/1.png &
setxkbmap fr

# run bar script and dwm ( do not remove this ) 
~/.config/dwm/bar/./bar.sh & 
