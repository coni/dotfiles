#!/bin/sh

# add your autostart stuffs here
# xrdb merge ~/Public/xresources/forest/.Xresources &
feh --bg-tile $HOME/.config/dwm/wallpaper/default.png &
setxkbmap fr

# run bar script and dwm ( do not remove this ) 
~/.config/dwm/bar/./bar.sh & 
