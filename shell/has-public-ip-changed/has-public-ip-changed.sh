#!/bin/bash

if [[ -f ip.dat ]]
then
    MOST_RECENT_IP=$(tail -1 ip.dat | awk '{print $3}')
else
    MOST_RECENT_IP=""
fi

CURRENT_IP=$(curl -s https://ipinfo.io | grep "\"ip\"\:" | awk '{print $2}' | sed -e 's/\"//g' | sed -e 's/\,//g')

if [[ $MOST_RECENT_IP != $CURRENT_IP ]]
then
    echo -e `date +"%F %R-%S"` "\t" $CURRENT_IP | tee -a ip.dat
else
    echo "IP has not changed!"
fi
