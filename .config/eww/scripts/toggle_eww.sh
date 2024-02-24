#!/usr/bin/env bash
#
# if the script doesn't work you have to adapt it for your need, im sorry
# xoxo

for i in $(seq $#);
do
    if [ "$(eww windows | grep -h "$1\$" | cut -c 1)" == "*" ]; then
            eww close $1
    else
            eww open $1
    fi
    shift 1
done
