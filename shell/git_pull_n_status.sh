#author: fazlerabbi37

#!/bin/bash

#git_pulls_n_status.sh

#the purpose of the shell script is to git pull or status in all existing repos of given directiory


#ask to enter the project directory
echo "Enter project location:"
echo "Try not to put / at the end (i.e /home/Projects/)"


#read location and save in variable pro
read pro

#check if any argument is passed though command line if not ask for it
if [ $# -lt 1 ]
then
    #ask if pull or status
    echo "Do you want to pull repo or check status?"
    echo "For git pull type without quote 'pull' and for git status 'status':"

    #read pull or status in variable gop
    read gop
else
    gop=$1
fi

#check if gop is pull or status; if not show invalid
if [ "$gop" == "pull" ] || [ "$gop" == "status" ] ; then

    for d in $pro/*/
    #loop through all the sub-directories of Project directories and giv command saved in var gop
    #take a sub-directory and save it in variable d
    do
        #change drive to the sub-dedicatory saved in variable d and give gop command
        echo ""
        echo -e "\e[0;34m-----------------------------------------------------------------------------\e[0m"
        echo $gop
        (cd "$d" && echo $d && git $gop)
        echo -e "\e[0;34m-----------------------------------------------------------------------------\e[0m"
        echo ""
    done
else
    echo -e "\e[31mInvalid input!!! Enter either 'pull' or 'status' without quote.\e[0m"
fi
