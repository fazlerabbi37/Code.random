#author: fazlerabbi37

#shell script name: backup_veracrypt_container.sh

#the purpose of the shell script is to backup VeraCrypt container

#!/bin/bash


veracrypt_mount(){
    #todo: check if veracrypt_console exist if not install it using install function

    read -p "Press enter to unmount all VeraCrypt volume and continue..."
    echo "Unmounting all VeraCrypt volume..."
    veracrypt_console -d
    echo ""
    
    #mount source_volume using veracrypt_console
    echo "Mounting source volume..."
    veracrypt_console --mount $source_volume
    source=/media/veracrypt1
    echo ""

    #mount destination_volume using veracrypt_console
    echo "Mounting destination volume..."
    veracrypt_console --mount $destination_volume
    destination=/media/veracrypt2
    echo ""

}

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
    rsync -vr --delete  $source/ $destination


    #say and show desktop notifications (confirmation)
    DISPLAY=:0.0 /usr/bin/notify-send "Backup complete"
    spd-say "Backup complete"

    #dismount all drive
    echo "Unmounting all VeraCrypt volume..."
    veracrypt_console -d

}

echo "Welcome to backup_veracrypt_container.sh script."
echo "This script assumes you have 'sudo' access to this device and VeraCrypt Console tool setup at '/usr/bin/veracrypt_console'."
echo "If not installed; install the console tool and re-run"
echo ""

sudo -v

if [[ $(which veracrypt_console) != "/usr/bin/veracrypt_console" ]]
then
    echo "'veracrypt_console' is not found at '/usr/bin/veracrypt_console'"
    kill $$
fi


echo "Enter the source volume location:"
#read source_volume
source_volume="/dev/sdb1"
echo ""

echo "Enter the destination volume location:"
#read destination_volume
destination_volume="/home/fazlerabbi37/fr37/personal/backups/pd/transend"
echo ""

if [[ ! -d $destination_volume ]]
then
    if [[ ! -f $destination_volume ]]
    then
        echo "Destination volume doesn't exist."
        echo "Make new volume..."
        echo ""
        veracrypt_console -c
    fi
fi

veracrypt_mount
backup

