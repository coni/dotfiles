while true
do
date="$(date +"%R")"
battery="$(batterystatus)"
string="$battery%   $date"

xsetroot -name "$string"
sleep 2
done