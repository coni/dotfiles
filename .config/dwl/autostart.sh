/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
swww-daemon &
dunst &

wlr-randr | grep DP-2>/dev/null
if [ "$?" -eq "0" ];
then
    /home/coni/.local/bin/porcelain DP-2
    wlr-randr --output DP-2 --mode 3840x2160@143.988007 --scale 2 --pos 0,0 
    wlr-randr --output eDP-1 --pos 0,1080 --mode 1920x1200
    wlr-randr --output HDMI-A-1 --mode 1920x1080 --pos -1920,0
else
    /home/coni/.local/bin/porcelain eDP-1
fi

