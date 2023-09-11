#!/usr/bin/env bash
#
# if the script doesn't work you have to adapt it for your need, im sorry
# xoxo

window_name=$1

if [ "$(eww windows | grep $window_name | cut -c 1)" == "*" ]; then
	eww close $window_name
else
	eww open $window_name
fi
