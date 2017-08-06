#author: fazlerabbi37

#shell script name: 

#the purpose of the shell script

#!/bin/bash

#variables
swap_name=/swapfile
g=G

function make_swap {

	#active all swap
	sudo swapon -a

	#save free -g commands output to free file
	free -g > free
	
	#find number of lines in free file and save it in variable last_line
	last_line="$(wc -l free | awk '{print $1}')"
	
	#find RAM size and save it in var ram
	ram="$(head -n 2 free | tail -n 1 | awk '{print $2}')"
	
	#find Swap size and save it in var swap
	swap="$(head -n $last_line free | tail -n 1 | awk '{print $2}')"

	#remove free file
	rm free

	#see if Swap exist and if yes exit script
	if [ $swap != 0 ]
	then
		echo "Swap exist in your system!"
		echo "Exiting script..."
		kill $$
	fi

	#check if ram is devisable by 2 if not add 1
	if [ $(($ram % 2)) != 0 ]
	then
		ram=$(($ram + 1))
	fi

	#print RAM size and ask if user want the Swap size same as RAM or double of that.
	echo "Your RAM size $ram$g"
	echo "Do you want your Swap size to be same as your RAM size or double of your RAM size?"
	read -p "For same size enter 1, for double size enter 2: " size_choice
	echo ""

	#take size_choice given by user and determine the Swap size and save it in variable swap_size
	swap_size="$(($ram * $size_choice))"

	#find the available space in root directory 
	available_space=$(df -h / | awk 'FNR == 2 {print $4}')
	available_space="${available_space::-1}"

	#see if there is enough space in root directory to make a swap file
	if [ $swap_size -gt $available_space ]
	then
		echo "You don't have enough space in your system"
		echo "Exiting script..."
		kill $$
	fi

	#make Swap file with fallocate and use swap_name as Swap file name and swap_size as Swap file size
	sudo fallocate -l $swap_size$g $swap_name

	#check Swap file info with ls command
	echo "Checking Swap file info with ls command..."
	ls -lh $swap_name
	echo ""

	#change Swap file permission
	sudo chmod 600 $swap_name

	#make Swap using mkswap command
	sudo mkswap $swap_name

	#Turn on Swap using swapon command
	sudo swapon $swap_name

	#echo Swap fileSwap file system info in /etc/fstab
	echo "Adding Swap fileSwap file system info in /etc/fstab"
	echo "#swap_tweak" | sudo tee -a /etc/fstab
	echo "$swap_name    none    swap    sw    0    0" | sudo tee -a /etc/fstab
	echo "" | sudo tee -a /etc/fstab
	echo ""

	#check swappiness
	echo "Current value of swappiness..."
	cat /proc/sys/vm/swappiness
	echo ""

	#add swappiness=10
	sudo sysctl vm.swappiness=10

	#check vfs_cache_pressure
	echo "Current value of vfs_cache_pressure..."
	cat /proc/sys/vm/vfs_cache_pressure
	echo ""

	#add vfs_cache_pressure=50
	sudo sysctl vm.vfs_cache_pressure=50

	#add swappiness vfs_cache_pressure in /etc/sysctl.conf
	echo "Adding swappiness and vfs_cache_pressure value in /etc/sysctl.conf"
	echo "#swap_tweak" | sudo tee -a /etc/sysctl.conf
	echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
	echo "vm.vfs_cache_pressure = 50" | sudo tee -a /etc/sysctl.conf
	echo "" | sudo tee -a /etc/sysctl.conf
	echo ""

	#reboot system in 60 seconds
	echo "The system will reboot in 60 seconds..."
	for i in {60..1}
	do
		echo -e "\e[1A"
		sleep 1s;
		echo -ne "Reboot in : "$i" Seconds\e[K"
	done

	#restart system
	sudo reboot
}



#try to make a file in root directory and save error log on log file
sudo touch /test.txt 2>log

#save error log data on err_log variable
err_log=$(<log)

#remove log file
rm log

#check if err_log variable is empty or not; will be empty is sudo because file will be created in root directory
if [[ ! -z $err_log ]]
then
	echo "you don't have sudo privilege to run this script"
	echo "Exiting script..."
	kill $$
else
	echo "you have sudo privilege to run this script"
	#remove test.txt form root directory
	sudo rm /test.txt
	echo "Running script..."
	make_swap
fi

