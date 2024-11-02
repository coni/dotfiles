#!/bin/sh


MONITOR=`cat $HOME/.config/eww/misc/monitor`
if [ "$1" == "title" ];
then
    while read line;
    do
        grep appid <<< "$line" > /dev/null
        if [ "$?" -eq "0" ];
        then
            cut -d ' ' -f2- <<< "$line"
        fi
    done < <(dwlmsg -o $MONITOR -w -c)
elif [ "$1" == "workspaces" ];
then
    counter=0
    maxtags=$(dwlmsg -o $MONITOR -g -T)
    current=0
    while read yes; do
        objects=()
        while read -r line; do
            if [ "$counter" -ge "$maxtags" ]; then
                counter=0
            else
                parameter=($line)
                id=${parameter[1]}
                windows=${parameter[3]}
                if [ "${parameter[2]}" -eq "1" ];
                then
                    current=$id
                fi
                objects+=("$(jq -a -c -n --arg id "$id" --arg windows "$windows" '{id: $id, windows: $windows}')")
                counter=$((counter + 1))
            fi
        done < <(dwlmsg -o $MONITOR -g -t)
        jq --argjson current "$current" --argjson maxtags "$maxtags" -c -M -s '{current: $current, max: $maxtags, workspaces: .}' <<< "${objects[@]}"
    done < <(dwlmsg -o $MONITOR -w -l)
elif [[ "$1" == "workspace" && "$#" -ge "2" ]];
then
    maxtags=$(dwlmsg -o $MONITOR -g -T)
    if [[ "$2" -lt "0" || "$2" -ge "$maxtags" ]];
    then
        exit 1
    fi
    dwlmsg -o $MONITOR -t $2
fi
