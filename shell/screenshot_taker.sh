#author: fazlerabbi37

#screenshot_taker.sh

#the purpose of the shell script to take screenshot using import command after a certain time and save it to a location

#!/bin/bash

#add checking for import program
exist=$(which import)

if [[ ! -z $exist ]]
then
    echo "import is installed"
else
    echo "import is not installed"
    read -p "Do you want to install import[Y/N]?" install
    if [[ $instal == "Y" ]]
    then
        echo "installing import..."
        sudo apt-get install imagemagick --fix-missing
    else
        echo "Exiting script..."
        kill $$
    fi
fi


#time interval on each screenshot
echo "How much time do you want to wait within each screenshot? (in seconds)"
read delay_time

#screenshot save directory (never end with '/' like using '/home/' is not permitted)
echo "Where do you want to save the screenshot?"
echo -e "\e[31m'/' after directory like /home/ is not allowed\e[0m"
read loc


#make a folder name in the format of dd-mm-yyyy ie. 10-Jan-2017
#get the current date form date command
current_date=$(date +"%d-%b-%Y")

#make a directory in the location with the value saved in current_date variable
mkdir -p $loc/$current_date


#echo a message
echo "screenshot_taker is in action. Press Ctrl+c to stop it."

#infinite while loop
while :
do
    #take screenshot and save it in location with current time
    import -window root $loc/$current_date/ss_$(date +"%T").png
    sleep $delay_time   #sleep for $delay_time second(s)
done
