#!/usr/bin/env bash
#
# if the script doesn't work you have to adapt it for your need, im sorry
# xoxo
#
# the argument 'get' must print the integer of the volume of the current audio device
# between 0 and 100
#
# the argument 'set' take as a parameter an int between 0 and 100
#

arg=$1
parameter=$2

if [ "$arg" == "get" ]; then
	pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d \/ -f 2 | sed 's/ //g' | sed 's/%//'
elif [ "$arg" == "set" ]; then
	pactl set-sink-volume @DEFAULT_SINK@ $parameter\%
elif [ "$arg" == "is_mute" ]; then
	pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2
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
