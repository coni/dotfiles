#!/bin/bash


if [[ "$1" = "length" ]];
then
    length=$(playerctl metadata --format "{{ duration(mpris:length) }}")
    minutes=$(echo $length | cut -d : -f 1)
    secondes=$(echo $length | cut -d : -f 2)
    total=$(((minutes * 60) + secondes))
    echo $total
elif [[ "$1" = "position" ]];
then
    length=$(playerctl metadata --format "{{ duration(position) }}")
    minutes=$(echo $length | cut -d : -f 1)
    secondes=$(echo $length | cut -d : -f 2)
    total=$(((minutes * 60) + secondes))
    echo $total
elif [[ "$1" = "download" ]];
then
    url=$(playerctl metadata mpris:artUrl)
    curl -L "$url" -o "$HOME/.config/eww/windows/music/current.jpg" >/dev/null 2>/dev/null
    while true;
    do
        sleep 1
        if [[ ! "$url" = "$(playerctl metadata mpris:artUrl)" ]];
        then
            url=$(playerctl metadata mpris:artUrl)
            curl -L "$url" -o "$HOME/.config/eww/windows/music/current.jpg" >/dev/null 2>/dev/null
            eww active-windows | grep music
            if [ "$?" -eq "0" ];
            then
                eww open --toggle music
                eww open --toggle music
            fi
        fi
    done
else
    playerctl metadata $1
fi
