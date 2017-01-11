#author: fazlerabbi37

#shell scritp name

#the purpose of the shell script

#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]] 
do
    echo $line
    spd-say "$line"
    sleep 3
done < "$1"
