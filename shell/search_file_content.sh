#author: fazlerabbi37

#shell scritp name

#the purpose of the shell script

#!/bin/bash

#ask and read a search url
echo -e "\e[31m'letterboxd.com' and 'http://letterboxd.com/search/?q=' are not the same !!!\e[0m"
echo -e "\e[31msecond one is the search url.\e[0m"
echo "Enter search url:"
read url


#ask for a file containing search content
echo "Enter file path:"
read file_path

#ask and take char that will be replace in place of space
echo "Enter char that will "
read char

#change space with char
sed -ie "s/ /$char/g" $file_path

while IFS='' read -r line || [[ -n "$line" ]]
do
    xdg-open $url$line 
done<"$file_path"

#change file back to original start by replacing char with space
sed -ie "s/$char/ /g" $file_path

echo "Press ctrl+c out exit"
