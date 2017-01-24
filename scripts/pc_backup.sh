#author: fazlerabbi37

#backup_pc.sh

#the purpose of the shell script is to backup my pc

#!/bin/bash

#display and say notification
DISPLAY=:0.0 /usr/bin/notify-send "You have a backup scheduled now"
spd-say "You have a backup scheduled now"
echo "You have a backup scheduled now"


#ask for start/wait/stop action
echo "Choose option (start/wait/stop):"
read option

#check option and take step based on the option
if [[ $option == "start" ]]
then
    DISPLAY=:0.0 /usr/bin/notify-send "starting backup now"
    spd-say "starting backup now"
    echo "starting backup now"
elif [[ $option == "wait" ]]
then
    DISPLAY=:0.0 /usr/bin/notify-send "Waiting"
    spd-say "Waiting"
    echo "Alright! let's wait... but for how long?"
    echo "Enter waiting time in seconds"
    read wait_time
    sleep $wait_time
    DISPLAY=:0.0 /usr/bin/notify-send "starting backup now"
    spd-say "starting backup now"
elif [[ $option == "stop" ]]
then
    DISPLAY=:0.0 /usr/bin/notify-send "backup stoped"
    spd-say "backup stoped"
    echo "backup stoped"
    kill $$
else
    echo -e "\e[31mInvalid entries: type start or wait or stop in the exact same case.\e[0m"
fi


echo "Enter the locataion where you want to keep the backed up file"
read destination

#make a folder name in the format of dd_mm_yyyy ie. 10_Jan_2017
u=_ #take a "_" in variable u
temp="$(date | awk '{print $3}')" #take dd form date command and save it in variable temp
dir=$dir$temp$u			  #concat dd saved in variable temp with variable dir
temp="$(date | awk '{print $2}')" #take mm form date command and save it in variable temp
dir=$dir$temp$u                   #concat mm saved in variable temp with variable dir
temp="$(date | awk '{print $6}')" #take yyyy form date command and save it in variable temp
dir=$dir$temp                     #concat yyyy saved in variable temp with variable dir

#make a directory in root(/) named /temp_backup if not found
if [ ! -d "/temp_backup" ];
then
    sudo mkdir /temp_backup
fi

#make a directory in /temp_backup with value saved in variable dir in a format (dd_mm_yyyy ie. 10_Jan_2017)
sudo mkdir /temp_backup/$dir

#make a exclude-list.txt and open with nano
if [ -f "exclude_list.txt" ];
then
    nano exclude_list.txt
else
    printf "#file name: exclude_list.txt\n#purpose: list all the directory(s) that will be excluded form backup\n#format: /dev/*\n\t#/proc/*\n" >>exclude_list.txt
    printf "#put one directory in one line\n#Press ctrl+x to finish editing\n\n#Defult exclude directorys\n " >>exclude_list.txt
    printf "/dev/*\n/proc/*\n/sys/*\n/tmp/*\n/run/*\n/mnt/*\n/media/*\n/lost+found\n/temp_backup/*\n" >>exclude_list.txt
    printf "\n\n\t\t\t\t#Edit form here#\n#----------------------------------------------------------------------#\n" >>exclude_list.txt
    printf "#User added directory(s)\n" >>exclude_list.txt
    nano exclude_list.txt
fi

#make a greb_content_list.txt and open with nano
if [ -f "greb_content_list.txt" ];
then
    nano greb_content_list.txt
else
    printf "#file name: greb_content_list.txt\n#purpose: list all the file(s) and sub-directory(s) of the listed directory(s) and save them in .txt file.\n" >>greb_content_list.txt
    printf "" >>greb_content_list.txt
    printf "#put one directory in one line\n#Press ctrl+x to finish editing\n" >>greb_content_list.txt
    printf "\n\n#User added directory(s)\n" >>greb_content_list.txt
    nano greb_content_list.txt
fi


#use rsync to backup the whole pc excluding the directories listed in exclude-list.txt
#options used: -a:archive mode; -A:preserve ACLs -X:preserve extended attributes;
#options used: -v:increase verbosity; --progress:show progress during transfer;
#options used: --exclude-from:exclude from a given file, in this case exclude-list.txt
sudo rsync -aAXv --progress --exclude-from 'exclude_list.txt' / /temp_backup/$dir

#the following loop read a file named 'greb_content_list.txt' line by line.
#each line of the file a directory. a text file is created containing list of all file and folder
#and saved under the same name and location.
while IFS='' read -r line || [[ -n "$line" ]]; do
    sudo mkdir -p /temp_backup/$foo/$line #make a directory if parent not found create them with -p
    s="/"
    output="$(cd $s$line && pwd | grep -o '[^/]*$')" #extract last directory name and save it in output variable
    #change directory to location saved on variable line run ls -LR command on that location
    #put the output on location saved in line variable with the name saved on output
    cd $s$line && ls -LR > /temp_backup/$foo/$line/$output.txt 
done < "greb_content_list.txt"


#make a archive with date saved in variable dir
#options used: -c:create a new archive -z:filter the archive through gzip
#options used: -v:verbosely list files processed -f:use archive file or device ARCHIVE
#using GZIP=-9 for better compression rate
env GZIP=-9 sudo tar -czvf /temp_backup/$dir.tar.gz /temp_backup/$dir

#move the archive file to a prefered location rather than /temp_location
sudo mv /temp_backup/$dir.tar.gz $destination 

#remove all file and folder from /temp_backup
sudo rm -rf /temp_backup/$foo


#display and say notification
DISPLAY=:0.0 /usr/bin/notify-send "Backup complete"
spd-say "Backup complete"
echo "Backup complete"


#ask if user want to stop the shutdown
echo "The system is going down for maintenance in 2 minutes!"
echo "To stop shutdown press ctrl+c"
sleep 120 #sleep for 2 minutes
sudo shutdown -P now #power off with -P
