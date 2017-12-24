#author: fazlerabbi37

#shell script name: side_switch.sh

#the purpose of the shell script is to switch side of speaker output depending on key pressed

#!/bin/bash

#get the current volume for left and right speaker and store it on current_left and current_right for later restore
current_left=$(amixer -D pulse sget Master | grep "Front Left:" | awk '{print $4}')
current_right=$(amixer -D pulse sget Master | grep "Front Right:" | awk '{print $4}')

while :
#infinite loop
do
    #read user input and save it in option
    read -rsn1 option

    #if option is i then exit script
    if [[ "$option" == "i" ]]
    then
        kill $$
    #if option is j then mute left
    elif [[ "$option" == "j" ]]
    then
        amixer -D pulse sset Master 0,$current_right 2>&1 /dev/null
    #if option is l then mute right
    elif [[ "$option" == "l" ]]
    then
        amixer -D pulse sset Master $current_left,0 2>&1 /dev/null
    #if option is l then mute both
    elif [[ "$option" == "k" ]]
    then
        amixer -D pulse sset Master 0,0 2>&1 /dev/null
    #if option is l then unmute both
    elif [[ "$option" == "K" ]]
    then
        amixer -D pulse sset Master $current_left,$current_right 2>&1 /dev/null
    fi
done
