#author: fr37



#this script can be used to connect to Wi-Fi form Linux terminal.
#this script usage  Network Manager Command Line Interface (nmcli) to do so.



#!/bin/bash



#show  all the available Wi-Fi access points
nmcli dev wifi



#prompt for the SSID of the network access point
echo "Please enter the SSID of the network you want to connect with. Without quote, exact case."
echo "SSID:"
read id #read SSID and save it in variable 'id'



#prompt for the password for that SSID
echo "Enter the password for the network. Don't worry if you can't see anything."
echo "Password:"
read -s pa #read password and save it in variable 'pa', -s for silent read



#connect to Wi-Fi
nmcli dev wifi connect $id password $pa
