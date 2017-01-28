#author: fazlerabbi37

#screenshot_taker.sh

#the purpose of the shell script to take screenshot using gnome-screenshot after a certain time and save it to a location

#!/bin/bash

#time interval on each screenshot
echo "How much time do you want to wait within each screenshot? (in seconds)"
read delay_time

#screenshot save directory (never end with '/' like using '/home/' is not permitted)
echo "Where do you want to save the screenshot?"
echo -e "\e[31m'/' after directory like /home/ is not allowed\e[0m"
read loc


#make a folder name in the format of dd_mm_yyyy_hh:mm:ss ie. 10_Jan_2017
u=_ #take a "_" in variable u
temp="$(date | awk '{print $3}')" #take dd form date command and save it in variable temp
dir=$dir$temp$u			  #concat dd saved in variable temp with variable dir
temp="$(date | awk '{print $2}')" #take mm form date command and save it in variable temp
dir=$dir$temp$u                   #concat mm saved in variable temp with variable dir
temp="$(date | awk '{print $6}')" #take yyyy form date command and save it in variable temp
dir=$dir$temp$u                   #concat yyyy saved in variable temp with variable dir
temp="$(date | awk '{print $4}')" #take hh:mm:ss form date command and save it in variable temp
dir=$dir$temp			  #concat hh:mm:ss saved in variable temp with variable dir

#make a directory in the location saved in loc variable with a format saved in variable dir
mkdir $loc/$dir

#take variable n with a value 1 that will increase with each screenshot taken 
n=1

#echo a message
echo "screenshot_taker is in action. Press Ctrl+c to stop it."

#infinite while loop
while :
do
    gnome-screenshot -f $loc/$dir/ss$n.png #take screenshot and save it in location
    echo "Number of screenshot taken: $n" #show screenshot counter
    n=$(( n+1 ))        #increase the value of n
    sleep $delay_time   #sleep for $delay_time second(s)
done
