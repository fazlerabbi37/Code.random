#author: fazlerabbi37

#!/bin/bash

#pendrive_backup.sh

#the purpose of the script is to backup pendrive data to local drive

#hard code source and destination
echo "Enter the pendrive location:"
echo "Usually found in /media/(username)/(pendrive_name)/"
read source

echo "Enter the local drive location:"
read destination

backup(){
    #say and show desktop notifications
    DISPLAY=:0.0 /usr/bin/notify-send "Starting backup within next 30 seconds"
    spd-say "Starting backup within next 30 seconds"

    #sleep for 10 seconds
    sleep 10

    #say and show desktop notifications
    DISPLAY=:0.0 /usr/bin/notify-send "20 seconds..."
    spd-say "20 seconds..."

    #sleep for 10 seconds
    sleep 10

    #say and show desktop notifications
    DISPLAY=:0.0 /usr/bin/notify-send "10 seconds.."
    spd-say "10 seconds..."

    #sleep for 10 seconds
    sleep 10

    #say and show desktop notifications
    DISPLAY=:0.0 /usr/bin/notify-send "Starting backup"
    spd-say "Starting backup"

    #rsync with source and destination
    rsync -r --delete  $source $destination


    #say and show desktop notifications (confirmation)
    DISPLAY=:0.0 /usr/bin/notify-send "Backup complete ✔"
    spd-say "Backup complete ✔"

}

if [ ! -d $destination ]
then
    echo "Destination directory doesn't exist. Making destination directory.."
    mkdir -p $destination
fi

if [ -d $source ]
then
    backup

else
    #say and show desktop notifications
    DISPLAY=:0.0 /usr/bin/notify-send "Pendrive is not pluged in. Plugin and press enter"
    spd-say "Pendrive is not pluged in. Plugin and press enter"

    #press enter to continue
    read -p "Press Enter to continue"

    backup

fi
