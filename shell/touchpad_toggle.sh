#author: fazlerabbi37

#touchpad_toggle.sh

#the purpose of the shell script is to toggle touchpad based on the presence of USB Mouse

#!/bin/bash


#find touchpad id and save it in variable t
touchpad_id=$(xinput list | grep "Touchpad" | awk '{print $6}')
touchpad_id=$(echo $touchpad_id | cut -d'=' -f2)

#disable the touchpad
function disable_touchpad() { 
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

#enable the touchpad
function enable_touchpad(){
    xinput set-prop $touchpad_id "Device Enabled" 1
}

#function detect_mouse detects USB mouse
function add_new_mouse() {
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

#help function
function show_help(){
    echo "touchpad_toggle help menu"
    echo "touchpad_toggle -h to show this menu"
    echo "touchpad_toggle -a to add new mouse"
    echo "touchpad_toggle -e to enable touchpad"
    echo "touchpad_toggle -d to disable touchpad"
}

if [ "$1" == "-h" ] || [ "$#" == 0 ]
then
    show_help
elif [ "$1" == "-a" ]
then
	add_new_mouse
elif [ "$1" == "-e" ]
then
    enable_touchpad
elif [ "$1" == "-d" ]
then
    disable_touchpad
fi
