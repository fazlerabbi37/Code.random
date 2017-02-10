#author: fazlerabbi37

#text_to_speech.sh

#the purpose of the shell script is to work as a text to speech converter

#!/bin/bash

echo "Start writing after the '>' sign."
echo "press ctrl+c to stop session."
while :
do
   read -p ">" line
   spd-say "$line"
done

