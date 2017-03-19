#source: http://stackoverflow.com/a/13701495/5350059

#author: fazlerabbi37

#name: path_converter.sh

#the purpose of the shell script is to convert file path from UNIX to Windows and vice versa

#!/bin/bash

#ask and read file path, save it to var path
echo "Enter file path:"
read path

#ask and read source path type, save it to var type
echo "Enter source path type."
echo "For UNIX type without quote 'u' and for Windows 'w':"
read type

#check type for u convert UNXI to Windows, for w convert Windows to UNIX, for all other show error message
if [[ $type == "u" ]]
then
    echo "Converting UNIX path to Windows..."
    echo "$path" | sed -e 's/^\///' -e 's/\//\\/g'
elif [[ $type == "w" ]]
then
    echo "Converting Windows path to UNIX..."
    echo -e "\e[31mError !!!\e[0m"
    echo -e "\e[31mProgrammer didn't find any working method for doing this operation. Trust the programmer, he really tried.\e[0m"
    echo -e "\e[31mProgrammer is helpless :(\e[0m"
    #echo "/$path" | sed -e 's/\\/\//g' -e 's/://'
    #echo "$path" | sed -e 's#\\#/#g' -e 's#\$#/\\$#g' -e 's#^\([a-zA-Z]\):#/\L\1#'
    #echo "/$path | "sed -e 's#^J:##' -e 's#\\#/#g'
else
    echo -e "\e[31mINVALID !!! type 'u' or 'w' without quote.\e[0m"
fi
