#author: fazlerabbi37

#shell script name: android_charger.sh

#the purpose of the shell script is to shutdown the pc when an android is fulled charged

#!/bin/bash

value_of_percentage=$(adb shell cat /sys/class/power_supply/battery/batt_attr_text | grep "Percentage(%)" | awk '{print $2}')

current_charge=${value_of_percentage::-2}

while :
do
    if [[ $current_charge == "100" ]]
    then
        echo "Battery is fully charged.Shutdown in 2 minutes."
        echo "The system will shutdown in 60 seconds..."
    	for i in {60..1}
    	do
    		echo -e "\e[1A"
    		sleep 1s;
    		echo -ne "Shutdown in : "$i" Seconds\e[K"
    	done

        #shutdown system
        systemctl poweroff
    else
        echo -e "\e[1A"
        echo -ne "Current Charge Level: $current_charge\e[K"
    fi
    sleep 60
done
