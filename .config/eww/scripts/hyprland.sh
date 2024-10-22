#!/usr/bin/env bash

if [ "$1" == "workspaces" ];
then
    spaces (){
            WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
            seq 1 10 | jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
    }

    spaces
    socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
            spaces
    done
elif [ "$1" == "active-workspace" ];
then
    hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'

    socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
      stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}'
elif [ "$1" == "title" ];
then
    hyprctl activewindow -j | jq --raw-output .title
    socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' '/^activewindow>>/{print $3}'
elif [ "$1" == "workspace" ];
then
    function clamp {
        min=$1
        max=$2
        val=$3
        python -c "print(max($min, min($val, $max)))"
    }

    direction=$2
    current=$3
    if test "$direction" = "down"
    then
            target=$(clamp 1 10 $(($current+1)))
            echo "jumping to $target"
            hyprctl dispatch workspace $target
    elif test "$direction" = "up"
    then
            target=$(clamp 1 10 $(($current-1)))
            echo "jumping to $target"
            hyprctl dispatch workspace $target
    fi
fi
