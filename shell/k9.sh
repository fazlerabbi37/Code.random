#author: fazlerabbi37

#shell script name: k9.sh 

#the purpose of the shell script is to kill -9 all PID of a given application

#!/bin/bash

#run sudo -v to insure sudo access
sudo -v

#save the application name given via arguments in app variavle
app=$1

#run a 'ps aux' and grep the app name from the output and save the PID given in column 2 in variable pids
pids=$(ps aux | grep $app | awk '{print $2}')

#loop through all the pid saved in pids variable and run kill -9 on them
for pid in $pids
do
    sudo kill -9 $pid 
done
