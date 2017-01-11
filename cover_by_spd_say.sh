#author: fazlerabbi37

#cover_by_spd_say.sh

#the purpose of the shell script is to read a text file with spd-say command of terminal

#!/bin/bash

#read one line form the file passed as argument and save it line variable 
while IFS='' read -r line || [[ -n "$line" ]] 
do
    #echo that line
    echo $line
    #say the line with spd-say
    spd-say "$line"
    #sleep for 3 seconds
    sleep 3
done < "$1"
