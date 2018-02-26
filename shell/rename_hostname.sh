#author: fazlerabbi37

#shell script name: rename_hostname.sh

#the purpose of the shell script is to rename hostname

#!/bin/bash

#ask for hostname and save it in hname
echo "Enter the hostname you want to give you machine:"
read hname

#be sudo
sudo -v

#change hostname in /etc/hosts
sudo sed -i "/127.0.1.1/c\127.0.1.1       $hname" /etc/hosts


#change hostname in /etc/hostname
echo $hname | sudo tee /etc/hostname

#reboot system
sudo reboot
