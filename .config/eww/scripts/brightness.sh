#!/bin/sh
#
# if the script doesn't work you have to adapt it for your need, im sorry
# xoxo
#
# the argument 'get' must print the integer of the brightness of the screen
# between 0 and 100
#
# the argument 'set' take as a parameter an int between 0 and 100
#

arg=$1
parameter=$2

if [ "$arg" == "set" ]; then
	if (( $parameter <= 100 && $parameter >= 1)); then
		brightnessctl set $2% > /dev/null
	fi
fi

if [ "$arg" == "get" ]; then
	brightnessctl | grep Current | cut -d \( -f 2 | sed 's/..$//'
fi
