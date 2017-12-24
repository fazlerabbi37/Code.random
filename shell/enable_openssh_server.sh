#author: fazlerabbi37

#shell scritp name enable_openssh_server.sh

#the purpose of the shell script is to enable openssh server and start ssh on boot

#!/bin/bash

#do sudo -v
sudo -v

#install openssh-server
sudo apt-get install openssh-server

#open /etc/ssh/sshd_config with nano
sudo nano /etc/ssh/sshd_config

#restart ssh service
sudo service ssh restart

#start ssh server on boot
sudo update-rc.d ssh defaults
