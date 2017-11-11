#author: fazlerabbi37

#shell script name: determine_distro.sh 

#the purpose of the shell script is to determine distro in a Linux system using release file

#!/bin/bash

if [ -f /etc/os-release ]
then
    echo "release file exists"
    . /etc/os-release
    distro_name=$NAME
    version=$VERSION_ID
else
    echo "release file doesn't exists"
    echo "Exiting script..."
    kill $$
fi

echo "Distro name= $distro_name"
echo "Version: $version"
