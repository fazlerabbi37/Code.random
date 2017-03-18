#author: fazlerabbi37

#name: disk_usages.sh

#the purpose of the shell script is to show disk usages

#!/bin/bash

#run a infinite loop and show the output of df in 1 second interval
while :
do
    echo "Press ctrl+c to exit"
    df
    sleep 1
    clear
done
