#author: fazlerabbi37

#shell script name: side_switch.sh

#the purpose of the shell script is to switch side of speaker output depending on key pressed

#!/bin/bash

#get the 100% volume and save it in variable limit
limit=$(amixer -D pulse sget Master | grep "Limits:" | awk '{print $5}')

#devide the limit by 2 and get half_limit
half_limit=$(( $limit / 2 ))

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
        amixer -D pulse sset Master 0,$limit 2>&1 /dev/null
    #if option is l then mute right
    elif [[ "$option" == "l" ]]
    then
        amixer -D pulse sset Master $limit,0 2>&1 /dev/null
    #if option is l then mute both
    elif [[ "$option" == "k" ]]
    then
        amixer -D pulse sset Master $half_limit,$half_limit 2>&1 /dev/null
    #if option is l then unmute right
    elif [[ "$option" == "K" ]]
    then
        amixer -D pulse sset Master 0,0 2>&1 /dev/null
    fi
done
