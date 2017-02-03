#author: fazlerabbi37

#!/bin/bash

#git_pulls.sh

#the purpose of the shell script is to git pull in all existing repos


#ask to enter the project directory
echo "Enter project location:"
echo "Try not to put / at the end (i.e /home/Projects/)"

#read location and save in variable pro
read pro


for d in $pro/*/
#loop through all the sub-directories of Project directories and give git pull command
#take a sub-directory and save it in variable d
do
    #change drive to the sub-dedicatory saved in variable d and give pull command
    (cd "$d" && echo $d && git pull)
done
