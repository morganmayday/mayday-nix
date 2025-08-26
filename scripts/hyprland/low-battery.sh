#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    if [ "$battery" -le "20" ]; then
        t2er=$(upower -i "$(upower -e | grep BAT)" | grep "time to empty" | awk '{print $4}')
        t2eh=${t2er:0:1}
        t2emr=${t2er:1:3}
        echo $t2emr
        if [[ $t2emr != 0 ]]; then
        t2emc=$(perl -se 'print $t2emr * 60' -- -t2emr="$t2emr")
        hyprctl notify 0 10000 0 "  Battery: ${battery}%"
        hyprctl notify 0 10000 0 "  Time remaining: ${t2eh}h ${t2emc}m"
        sleep 240
        fi
    else
        sleep 120
    fi
done
