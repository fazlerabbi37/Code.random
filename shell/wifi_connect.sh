#author: fazlerabbi37

#shell script name: wifi_connect.sh

#this script can be used to connect to Wi-Fi form Linux terminal

#!/bin/bash

#determine_distro
if [ -f /etc/os-release ]
then
    echo "release file exists"
    . /etc/os-release
    distro_name=$NAME
    version=$VERSION_ID
else
    echo "release file doesn't exists"
    #TODO add menual input for distro name and version
fi


if [[ $distro_name == "Ubuntu" ]]
then
    #check if nmcli is installed if not as to install
    e=$(which nmcli)

    if [ -z $e  ]
    then
        echo "You don't have nmcli installed..."
        read -p "D you want to install it?[y/n]" cho
        if [ "$cho" = "y" ]
        then
            sudo apt-get install network-manager
        else
            echo "exeting script.."
            kill $$
        fi
    fi


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
    nmcli dev wifi connect $id password $pai
elif [[ $distro_name == "Raspbian"* ]]
then
    #get sudo authentication
    sudo -v

    #show  all the available Wi-Fi access points
    sudo iwlist wlan0 scan | grep -E ESSID | awk '{print $1}'

    #prompt for the SSID of the network access point
    echo "Please enter the SSID of the network you want to connect with. Without quote and ESSID: part, exact case."
    echo "SSID:"
    read id #read SSID and save it in variable 'id'
    #prompt for the password for that SSID
    echo "Enter the password for the network. Don't worry if you can't see anything."
    echo "Password:"
    read -s pa #read password and save it in variable 'pa', -s for silent read

    #configure wpa_supplicant.conf file
    wpa_passphrase $id $pa | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null

    #econfigure the interface
    sudo wpa_cli -i wlan0 reconfigure

    #delete plane text password from /etc/wpa_supplicant/wpa_supplicant.conf
    sudo sed -i '/#psk=/d' /etc/wpa_supplicant/wpa_supplicant.conf 
fi
