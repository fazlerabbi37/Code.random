#author: fazlerabbi37

#multi_repos_git_clone.sh

#the purpose of the shell script it to clone multiple urls using git.

#!/bin/bash

#ask and read a directory location where to save the cloned repos and save it in varibale dir
echo "Enter a directory location where the cloned repos will go:"
read dir


#check if git_clone_urls.txt exist; if yes open file or create new file
if [ -f "git_clone_urls.txt" ];
then
     nano git_clone_urls.txt
     read -p "Press Enter to continue"
else
     printf "#file name: git_clone_urls.txt\n#purpose: list all urls that are to be cloned.\n">>git_clone_urls.txt
     printf "#Press ctrl+o to save.\n#Press ctrl+x to finish editing.\n\n">>git_clone_urls.txt
     printf "#------------------------------------------instructions----------------------------------------------#\n\n">>git_clone_urls.txt

     printf "#READ THIS INSTRUCTION CAREFULLY!!!\n">>git_clone_urls.txt
     printf "#put one url in one line.\n">>git_clone_urls.txt
     printf "#----------------------------------------------------------------------------------------------------#\n">>git_clone_urls.txt
     printf "\n\t\t\t\t\t#Edit form here#\n">>git_clone_urls.txt
     printf "#----------------------------------------------------------------------------------------------------#\n">>git_clone_urls.txt
     printf "#User added git urls\n">>git_clone_urls.txt
     nano git_clone_urls.txt
     read -p "Press Enter to continue"
fi

#skip the comment
linesToSkip=14
{
    for ((i=$linesToSkip;i--;)) ;do
        read
        done
    while read line ;do
	#change directory to location saved in var $dir and run git clone with url saved in var $line
        cd $dir && git clone $line
	#print a newline
        printf "\n"
	#sleep for 5 seconds
	sleep 5
	done
} < git_clone_urls.txt

#remove git_clone_urls.txt file
rm git_clone_urls.txt
