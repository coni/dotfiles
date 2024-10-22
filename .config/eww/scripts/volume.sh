#!/bin/sh

arg=$1
parameter=$2

if [ "$arg" == "get" ]; then
    pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d \/ -f 2 | sed 's/ //g' | sed 's/%//'
    while read -r line;
    do
        grep sink <<< "$line" > /dev/null
        if [ "$?" -eq "0" ];
        then
            pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d \/ -f 2 | sed 's/ //g' | sed 's/%//'
        fi
    done < <(pactl subscribe)
elif [ "$arg" == "set" ]; then
	pactl set-sink-volume @DEFAULT_SINK@ $parameter\%
elif [ "$arg" == "is_mute" ]; then
    pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2
    while read -r line;
    do
        grep sink <<< "$line" > /dev/null
        if [ "$?" -eq "0" ];
        then
            pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2
        fi
    done < <(pactl subscribe)
elif [ "$arg" == "up" ]; then
    is_mute=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2)
    if [ "$is_mute" == "no" ];
    then
        pactl set-sink-volume @DEFAULT_SINK@ +1%
    fi
elif [ "$arg" == "down" ]; then
    is_mute=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2)
    if [ "$is_mute" == "no" ];
    then
        pactl set-sink-volume @DEFAULT_SINK@ -1%
    fi
fi
