#!/bin/sh

if [ "$1" == "toggle" ];
then
    power_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
    if [ "$power_status" == "yes" ];
    then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
    exit 0
elif [ "$1" == "monitor" ];
then
    if [ -z "$(which bluetoothctl 2>/dev/null)" ];
    then
        while true;
        do
            echo -e '{"power": "none"}'
            sleep 120
        done
    else
        while read line;
        do
            power_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
            power=$( [ "$power_status" == "yes" ] && echo true || echo false )

            devices_connected=$(bluetoothctl devices Connected | wc -l)

            echo -e "{\"devices\": \"$devices_connected\", \"power\": \"$power\"}"
        done < <(dbus-monitor --system "type='signal',sender='org.bluez'" 2>/dev/null)
    fi
fi
