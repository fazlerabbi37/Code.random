#author: fazlerabbi37

#shell script name: are_you_sudo.sh 

#the purpose of the shell script is to check if a user has sudo privilege or not

#!/bin/bash

#try to make a file in root directory and save error log on log file
sudo touch /test.txt 2>log

#save error log data on err_log variable
err_log=$(<log)

#remove log file
rm log

#check if err_log variable is empty or not; will be empty is sudo because file will be created in root directory
if [[ ! -z $err_log ]]
then
	echo "You don't have sudo privilege"
else
	echo "You have sudo privilege"
	#remove test.txt form root directory
	sudo rm /test.txt
fi
