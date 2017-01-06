#author: fr37

#!/bin/bash

#shell scritp name

#the purpose of the script is to backup pendrive data to local drive

#hard code source and destination
source=
destination=

#show desktop notifications
DISPLAY=:0.0 /usr/bin/notify-send "Plugin Pendrive within next 30 seconds for backup"

#sleep for 10 seconds
sleep 10

#show desktop notifications
DISPLAY=:0.0 /usr/bin/notify-send "20 seconds..."

#sleep for 10 seconds
sleep 10

#show desktop notifications
DISPLAY=:0.0 /usr/bin/notify-send "10 seconds.."

#sleep for 10 seconds
sleep 10

#rsync with source and destination
rsync -r --delete  $source $destination

#show desktop notifications (confirmation)
DISPLAY=:0.0 /usr/bin/notify-send "Pendrive Synced ✔"
