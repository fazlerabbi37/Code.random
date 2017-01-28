#author: fazlerabbi37

#connection_tester.sh

#the purpose of the shell script is to test network connectivity using ping command

#!/bin/bash

#infinite while loop
while :
do
    #ping once, try to grab if 64 bytes of packet are sent or not and save the output in variable a
    a="$(ping -c 1 8.8.8.8 | grep '64 bytes')"
    #save the first and second colunm of the output in variable b
    #an active ping should sned 64 bytes and therefore in be 64bytes should be saved 
    b="$(echo $a | awk '{print $1 $2}')"

    #check if b variable has 64bytes has on it or not
    if [[ $b = 64bytes ]]; then
        #if yes send push and audio notification and break the loop 
	DISPLAY=:0.0 /usr/bin/notify-send "Connected to internet"
	spd-say "Connected to internet"
        break
    else
	#if no send desktop notification and sleep for 20 seconds
	DISPLAY=:0.0 /usr/bin/notify-send  "Trying to connect to internet"
	sleep 20
    fi
done
