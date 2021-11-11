theme="full_circle"
dir="$HOME/.config/rofi/powermenu"
²
color="letsfrans.rasi"
theme="row_square.rasi"

sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

rofi_command="rofi -theme $dir/$theme"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""


# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
chosen="$(echo -e "$options" | $rofi_command -p "hihi" -dmenu)"

case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		xsecurelock
        ;;
    $suspend)
		systemctl suspend
        ;;
    $logout)
		loginctl terminate-session ${XDG_SESSION_ID-}
        ;;
esac