is_battery=false
if [ -f "/usr/local/bin/batterystatus" ]; then
    is_battery=true
    echo "oui"
fi

while true
do
string="$(date +"%R")"

if [ $is_battery = true ]; then
    string="$(batterystatus)%  $string"
fi

xsetroot -name "$string"
sleep 2
done
