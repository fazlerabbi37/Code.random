#author: fazlerabbi37

#touchpad_toggle.sh

#the purpose of the shell script is to toggle touchpad based on the presence of USB Mouse

#!/bin/bash


#find touchpad id and save it in variable t
touchpad_id=$(xinput list | grep "Touchpad" | awk '{print $6}')
touchpad_id=$(echo $touchpad_id | cut -d'=' -f2)

#toggles the touchpad
function touchpad_toggle() { 
	while read -r line
	do
		if_mouse_exists=$(lsusb | grep "$line")
		#if exist turn off touchpad
		if [[ ! -z "$if_mouse_exists" ]]
		then
    		echo "USB Mouse Detected"
    		xinput set-prop $touchpad_id "Device Enabled" 0
		fi
	done < "/home/$USER/.mouse_name"	
}


#function detect_mouse detects USB mouse
function detect_mouse() {
	echo "Please plug-out your USB mouse and press enter"
	sleep 5s
	read -p "Press Enter to continue"
	lsusb > without_mouse.txt
	sleep 5s
	echo "Please plug-in your USB mouse and press enter"
	echo "Please don't enter any other USB device other the the mouse"
	sleep 5s
	read -p "Press Enter to continue"
	lsusb > with_mouse.txt
	sleep 5s
	comm -23 <(sort with_mouse.txt ) <(sort without_mouse.txt) > mouse.txt
	read mouse < mouse.txt
	to_be_deleted_part="$(echo $mouse | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6}')"
	mouse_name=${mouse#$to_be_deleted_part}
	echo $mouse_name >> /home/$USER/.mouse_name
	rm without_mouse.txt with_mouse.txt mouse.txt
	
} 


if [ "$1" == "-d" ]
then
	detect_mouse
	kill $$
elif [ "$1" == "-h" ]
then
	echo "Pass argument -d to detect a USB mouse and -h to show this message"
	kill $$
fi

if [ -e "/home/$USER/.mouse_name" ]
then
	touchpad_toggle
else
	detect_mouse
	touchpad_toggle
fi
