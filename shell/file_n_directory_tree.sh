#author: fazlerabbi37

#file_n_directory_tree.sh

#the purpose of the shell script is to build a file and sub-directory tree of the given directory

#!/bin/bash

#ask for directory location
echo "Enter the path of the directory:"
read dir #read input and save it in variable dir

#ask for the location of output.txt file
echo "Where you want the output file"
read out

#name of the directory
output="$(cd $dir && pwd | grep -o '[^/]*$')"


#change directory to location saved on variable dir run ls -LR command on that location
#put the output on location saved in out variable with the name saved on output
cd $dir && ls -ALR > $out/$output.txt
