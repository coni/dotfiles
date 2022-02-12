#!/bin/sh

hex_prefix=0x
hex_num=$(printf '%x' $XSCREENSAVER_WINDOW)
window_id=$hex_prefix$hex_num

xloadimage -windowid $window_id $HOME/.config/dwm/wallpaper/lockscreen.png
