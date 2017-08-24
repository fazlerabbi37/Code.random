#author: fazlerabbi37

#shell script name: crossover.sh 

#the purpose of the shell script in a Debian based systems

#!/bin/bash

#enable the 32-bit packages
sudo dpkg --add-architecture i386 ; sudo apt-get update

#install gdebi package manager
sudo apt-get install gdebi

#download the latest .deb file
wget http://crossover.codeweavers.com/redirect/crossover.deb

#install the CrossOver .deb using gdebi
sudo gdebi crossover.deb

#remove the .deb file
rm crossover.deb

#open wine library
sudo nautilus /opt/cxoffice/lib/wine
