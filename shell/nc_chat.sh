#author: fazlerabbi37

#idea source:http://askubuntu.com/a/665507/502875

#nc_chat.sh

#the purpose of the shell script is to use netcat to chat on a lan

#!/bin/bash

#ask for a nickname and save it in name variable
echo "Enter the nickname you want to use:"
read name

#ask if user want to be a server or a client and save it in s_or_c variable
echo "Do you want to be a server or a client"
echo "Enter s for server and c for client"
read s_or_c

#check the choice and proced as wished
if [ "$s_or_c" = "s" ]; then
    #show the user that he is the server
    echo "You are the server"
    echo "Enter the port you want to use:"
    read port #read port and save it in port variable
    echo "Configuration complete!"
    echo "Tell your client to press enter and continue configuring on his side"
    echo "Be patient!!!"
    mawk -W interactive '$0="'$name': "$0' | nc -l $port #start session
elif [ "$s_or_c" = "c" ]; then
    echo "You are the client"
    read -p "Press enter when the server has finished configuring"
    echo "Wait for 10 seconds"
    sleep 10
    echo "Enter your server ip address:"
    read ip
    echo "Enter the port address:"
    read port
    echo "Connected to server"
    mawk -W interactive '$0="'$name': "$0' | nc $ip $port
else
    echo -e "\e[31mINVALID!!! Enter only s or c.\e[0m"
fi;
