#!/bin/sh
xrdb ~/.Xressources
feh --bg-tile --bg-center $HOME/.config/dwm/wallpaper/default.png &
setxkbmap us
dwm-msg run_command xrdb
bash $HOME/.config/dwm/bar.sh &
