#author: fazlerabbi37

#shell script name: git_ssh_and_https_converter.sh 

#the purpose of the shell script is to take a address as command line argument, check if it is SSH or HTTPS and convert it to other format

#!/bin/bash

#read the command line argument and save it in variable address
address="$1"


#define function ssh_to_https that converts a SSH address to HTTPS address
function ssh_to_https() {

	prefix="git@github.com:"
	address=${address#$prefix}
	address="https://github.com/"$address
	echo $address
}

#define function https_to_ssh that converts a HTTPS address to SSH address
function https_to_ssh() {

	prefix="https://github.com/"
	address=${address#$prefix}
	address="git@github.com:"$address
	echo $address
}

if [[ $address == *"git@github.com:"* ]]
then
	echo "Converting SSH address to HTTPS address..."
	ssh_to_https
elif [[ $address == *"https://github.com/"* ]]
then
	echo "Converting SSH address to HTTPS address..."
	https_to_ssh
fi

