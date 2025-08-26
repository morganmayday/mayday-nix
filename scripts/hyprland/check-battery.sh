#!/bin/sh
battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
t2er=$(upower -i "$(upower -e | grep BAT)" | grep "time to empty" | awk '{print $4}')
t2eh=${t2er:0:1}
t2emr=${t2er:2:3}
t2emc=$(perl -se 'print $t2emr * 60' -- -t2emr="$t2emr")
hyprctl notify 1 5000 0 "  Battery: ${battery}%"
hyprctl notify 1 5000 0 "  Time remaining: ${t2eh}h ${t2emc}m"
