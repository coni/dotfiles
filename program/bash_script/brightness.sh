yo=$(xrandr --verbose --current | grep Brightness)
IFS=' ' read -ra current_brightness <<< "$yo"
current_brightness=${current_brightness[1]}

if [ "$1" == "+" ]; then
new_brightness=$(awk '{print $2+$1}' <<< "${2} ${current_brightness}")
else
new_brightness=$(awk '{print $2-$1}' <<< "${2} ${current_brightness}")
fi

xrandr --output eDP1 --brightness $new_brightness