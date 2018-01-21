#author: fazlerabbi37

#shell script name: are_you_charging.sh

#the purpose of the shell script is to determine if laptop is connected to power supply or not and notifying the user

#!/bin/bash

#get the battery status from AC power supply's online status and save it in variable status
status=$(cat /sys/class/power_supply/*/online)

#check if status and notify
if [[ $status == "1" ]]
then
    echo "connected to power supply"
    DISPLAY=:0.0 /usr/bin/notify-send "connected to power supply"
else
    echo "not connected to power supply"
    DISPLAY=:0.0 /usr/bin/notify-send "not connected to power supply"
fi
