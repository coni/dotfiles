#!/bin/sh

while read line;
do
    [[ "$(nmcli radio wifi)" = "enabled" ]] && airplane=false || airplane=true

    nmcli -t -f DEVICE,STATE device | awk -F':' -v airplane="$airplane" '
    BEGIN { wifi = "\"none\""; eth = "false" }
    /^wl[a-z0-9]+:/ { wifi = ($2 == "connected") ? "true" : "false" }
    /^enp[0-9]s[0-9a-z]*:/ { eth = ($2 == "connected") ? "true" : "false" }
    END { print "{\"wifi\": " wifi ", \"eth\": " eth ", \"airplane\": " airplane "}" }'
done < <(nmcli monitor)
