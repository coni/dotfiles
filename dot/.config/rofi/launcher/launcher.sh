#!/usr/bin/env bash

theme="slate_full"
color="letsfrans"
theme="slate_center"

dir="$HOME/.config/rofi/launcher/"

sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
