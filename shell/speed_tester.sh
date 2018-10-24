#author: fazlerabbi37

#speed_tester.sh

#the purpose of the shell script is to test the network speed by downloading a file of 5MB.

#!/bin/bash


#show a message 
echo "downloading a standard 5MB zip file..."

#download a file form thinkbroadband.com and find out its download time with time command 
#save the real time value and save it on down_time variable
down_time=`/usr/bin/time -f %e wget -q -o /tmp/5MB.zip http://download.thinkbroadband.com/5MB.zip 2>&1`

#save the integer part of down_time on variable time_sec
time_sec="$(echo $down_time | awk -F. '{print $1}')"

#get the kbps value by dividing 5120kb by variable time_sec  
kbps=`expr 5120 / $time_sec`

#show info in tarminal
echo "it took $down_time seconds to download the file at an average speed of $kbps kbps"

#show info as notification
DISPLAY=:0.0 /usr/bin/notify-send "t: $down_time s; s: $kbps kbps"

#remove downloaded file
rm /tmp/5MB.zip

