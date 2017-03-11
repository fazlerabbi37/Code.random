#author: fazlerabbi37

#touchpad_toggle.sh

#the purpose of the shell script is to toggle touchpad based on the presence of USB Mouse

#!/bin/bash

#find touchpad id and save it in variable t
t=$(xinput list | grep "Touchpad" | awk '{print $6}')
t=$(echo $t | cut -d'=' -f2)


#run lsusb and 'see' if "Optical Mouse" is present by using 'grap' command and save it in varable e
e=$(lsusb | grep "Optical Mouse")

#if exist turn off touchpad
if [[ ! -z "$e" ]]
then
    echo "USB Mouse Detected"
    xinput set-prop $t "Device Enabled" 0
else
    xinput set-prop $t "Device Enabled" 1
fi
