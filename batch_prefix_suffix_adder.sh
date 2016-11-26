#author: fr37


#!/bin/bash



#function for adding prefix to string
prefix () {

#ask for prefix to add with string
echo "enter the prefix you want to add"

read pre #save it in variable pre

IFS=$'\n'
for line in `cat $filename` #loop through file and take a line in variable line
do
	temp=$pre$line #concat $pre and $line and save it in a variable temp
	echo $temp >> prefix.txt #write the new (prefix added) line to a file prefix.txt
done
}


#function for adding suffix to string
suffix () {

#ask for suffix to add with string
echo "enter the suffix you want to add"

read suf #save it in variable suf

IFS=$'\n'
for line in `cat $filename` #loop through file and take a line in variable line
do
        temp=$line$suf #concat $line and $suf and save it in a variable temp
        echo $temp >> suffix.txt #write the new (suffix added) line to a file suffix.txt
done
}



#take file from command line and save file in thevariable filename
filename=$1

#checks if user passed a file in the argument or not
if [ -n "$filename" ]; then #if filename varibale is not empty go to next call
	#ask for affix choice
	echo "Enter p for prefix and s for suffix"
	read aff #affix #save the choice in a variable aff

	#check for the choice usig aff variable and call the function based on the choice
	if [[ $aff == *"p"* ]]; then #checks if aff equal p
        	prefix #call prefix function
	elif [[ $aff == *"s"* ]]; then #checks if aff equal s
        	suffix #call suffix function
	else
        	echo -e "\e[31mError: use lower case p and s for prefix-suffix selection\e[0m" #if any of p or s string found echo this
	fi

else #
	echo -e "\e[31mError: no file found\e[0m" #if file not found echo this
fi

