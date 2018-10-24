#author: fazlerabbi37

#shell script name: ssh_if_host_up.sh 

#the purpose of the shell script is to ssh to a host if host up

#!/bin/bash


if [[ $# -eq 1 ]]
then
    echo $1
    remote_host_ip=$1
else
    echo "Enter ip address: "
    read remote_host_ip
fi

while :
do
    #ping once, try to grab if 64 bytes of packet are sent or not and save the output in variable a
    a="$(ping -c 1 $remote_host_ip | grep '64 bytes')"
    #save the first and second colunm of the output in variable b
    #an active ping should sned 64 bytes and therefore in be 64bytes should be saved 
    b="$(echo $a | awk '{print $1 $2}')"

    #check if b variable has 64bytes has on it or not
    if [[ $b = 64bytes ]]; then
        #if yes echo message, ssh into remote host and break the loop
	echo "Host with $remote_host_ip ip is up..."
	echo "Logging in to remote host with ssh..."
	ssh -X $remote_host_ip
	break
    else
	#if no send echo message and sleep for 20 seconds
	echo "Host with $remote_host_ip ip is down..."
	sleep 20
    fi
done
