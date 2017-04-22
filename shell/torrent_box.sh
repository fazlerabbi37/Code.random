#author: fazlerabbi37

#source: https://www.howtogeek.com/142044/how-to-turn-a-raspberry-pi-into-an-always-on-bittorrent-box/

#name: torrent_box.sh 

#the purpose of the shell script is to make a raspberry pi to seed torrent

#!/bin/bash

#install deluged
echo "installing deluged..."
sudo apt-get -y install deluged

#install deluge-console
echo "installing deluge-console..."
sudo apt-get -y install deluge-console

#sleep for 10 seconds
echo "sleeping for 10 seconds..."
sleep 10

#start deluged daemon to creates config file
echo "starting deluged daemon..."
deluged

#kill deluged daemon so that we can edit it
echo "killing deluged daemon..."
sudo pkill deluged

#backup old auth file
echo "backing up old auth file"
cp ~/.config/deluge/auth ~/.config/deluge/auth.old

#adding deluge user and set password
echo "adding deluge user and set password"
echo "script defult user name is 'pi' and password is 'raspberry'; if you are ok with it just exit editor"
echo "to add castome user and password replace 'pi' with your desire user name and replace 'raspberry' with desire password"
echo "pi:raspberry:10" >> ~/.config/deluge/auth
nano ~/.config/deluge/auth

#start deluged daemon
echo "starting deluged daemon..."
deluged

#start deluge-console
echo "starting deluge-console..."
deluge-console

#quick config change; allow remote access in deluge and exit
echo "chnaging deluge config to allow remote access..."
deluge-console config -s allow_remote True
deluge-console config allow_remote
deluge-console exit

#restart deluged daemon
echo "restarting deluged daemon..."
sudo pkill deluged
deluged

#set vpn after this part


