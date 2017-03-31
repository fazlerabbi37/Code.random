#author: fazlerabbi37

#shell scritp name

#the purpose of the shell script

#!/bin/bash


#save current time in am/pm form date command
time=$(date  +"%I:%M %p")

#notify time
echo $time
DISPLAY=:0.0 /usr/bin/notify-send "$time"
spd-say "$time"
