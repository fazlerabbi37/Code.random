#author: fazlerabbi37

#shell script name: download_new_songs.sh 

#the purpose of the shell script is to take a youtube link and downlaod if it's title is not in a songs_list

#!/bin/bash

echo "We are asuming thet the songs_list is file that contains all the songs name/title one each in a line and all songs have the .mp3 extention."

if [ $# -lt 1 ]
then
    echo "Enter the youtube URL:"
    read youtube_link
    #echo "Enter the songs_list files full path:"
    #read file_name
else
    youtube_link=$1
    file_name=$2
fi

video_title=$(youtube-dl --get-title $youtube_link)
echo "Video title: '$video_title'"

file_name="/home/fazlerabbi37/fr37/Projects/ess/songs_list.txt"
exist=true

IFS=$'\n'

for line in `cat $file_name`
do
    
    if [[ $video_title != *"${line%.mp3}"* ]]
    then
        exist=false
    else
        echo "Song found..."
        echo "Song name: $line"
        exist=true
        break
    fi
done

if [[ $exist == 'false' ]]
then
    echo "Song not found..."
    echo "Downloading song..."
    youtube-dl -q --extract-audio --audio-format mp3 $youtube_link
    echo "Download fininsed..."
fi
