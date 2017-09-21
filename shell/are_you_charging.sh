#author: fazlerabbi37

#shell script name: are_you_charging.sh

#the purpose of the shell script is to determine if laptop is charging or not and notifying the user

#!/bin/bash

#get the battery status from upower command and save it in variable status
status=$(upower -i $(upower -e | grep 'BAT') | grep "state" | awk '{print $2}')

#check if status and notify
if [[ $status == "charging" ]]
then
    echo "charging"
    DISPLAY=:0.0 /usr/bin/notify-send "charging"
elif [[ $status == "discharging" ]]
then
    echo "discharging"
    DISPLAY=:0.0 /usr/bin/notify-send "discharging"
fi
