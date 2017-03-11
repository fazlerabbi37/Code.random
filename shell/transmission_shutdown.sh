#author: Oli♦ (https://askubuntu.com/users/449/oli) with a bit mod by fazlerabbi37

#source: http://askubuntu.com/a/288381/502875

#transmission_shutdown.sh

#the purpose of the shell script is to shutdown Transmission when all download is complete

#!/bin/bash

#find if transmission-remote exist or not
e=$(which transmission-remote)
if [[ ! -z "$e" ]]
then
    echo -e "\e[32mtransmission-remote exist.\e[0m"
else
    echo -e "\e[31mtransmission-remote doens't exist!!!\e[0m"
    echo "install transmission-remote to continue."
fi

#check if Remote Control in Transmission is no or not
e="$(transmission-remote --list | awk 'FNR == 1 {print $1 $3 $5 $7 $9}')"
# if the variable e is equal to the give string
if [[ $e == "IDHaveUpRatioName" ]]
then
    #echo message
    echo "Remote Control in Transmission is no."
    echo -e "\e[31mScript dosen't work if any torrent is paused\e[0m"
    echo "Checking on each 30 seconds if downlaod is complete or not..."
    #run a infinite while loop with 30 seconds sleep
    #see how many active downlaods are in Transmission
    #if not active download sent dbus request to shutdown
    while :
    do
	count=$(transmission-remote --list | sed '1d;$d' | grep -v Done | wc -l)
    	#when count is 0 means all downlaod complete proceed to shutdown
    	if [ $count -eq 0 ]
    	then
	    echo "Downlaod complete. Shutdown in 2 minutes."
	    spd-say "Downlaod complete. Shutdown in 2 minutes."
	    DISPLAY=:0.0 /usr/bin/notify-send "Downlaod complete. Shutdown in 2 minutes."
	    sleep 120
            /usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop

        fi
	#sleep for 30 seconds
	sleep 30
    done
else
	echo -e "\e[31mRemote Control in Transmission is off!!! Please turn it on.\e[0m"
fi

