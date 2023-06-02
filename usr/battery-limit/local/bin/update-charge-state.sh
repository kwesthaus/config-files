#!/bin/bash

CURRENT_PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
CURRENT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
HTTP_PASSWD=$(cat /home/orville/.credentials/laptop-smartplug.txt)

echo  "Percent: $CURRENT_PERCENT"
echo  "Status: $CURRENT_STATUS"

if [ "$CURRENT_STATUS" != "Discharging" ] && [ $CURRENT_PERCENT -ge 70 ]; then
    echo "Charged above 70%, attempting to turn power off"
    curl --silent --verbose "http://192.168.12.12/cm?user=admin&password=$HTTP_PASSWD&cmnd=Power%20off"
elif [ "$CURRENT_STATUS" == "Discharging" ] && [ $CURRENT_PERCENT -le 65 ]; then
    echo "Discharged below 65%, attempting to turn power on"
    curl --silent --verbose "http://192.168.12.12/cm?user=admin&password=$HTTP_PASSWD&cmnd=Power%20On"
else
    echo "No power toggle needed, quitting"
fi

