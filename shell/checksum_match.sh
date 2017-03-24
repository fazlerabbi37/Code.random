#author: fazlerabbi37

#name: checksum_match.sh

#the purpose of the shell script it to match checksum of a given file

#!/bin/bash

#ask for SAH version and save in var sha_version
echo "Enter SHA version(i.e. sah1sum, sha256sum, sha512sum):"
read sha_version

#ask for file location file_path
echo "Enter the file path(i.e. /home/test/Downloads/OS.iso):"
read path

#ask for given sha sum
echo "Enter the given SHA sum"
read given_sha_sum

#extract file name
file_name=$(basename "$path")
#echo $file_name
#extract file path
file_path=$(echo ${path%/*})
#echo $file_path

#change directory and calculate sum
echo "calculating sum..."
cd $file_path && temp=$($sha_version $file_name)
#echo $temp
file_sha_sum=$(echo ${temp% *})
#echo $file_sha_sum

echo "comparing sum..."
if [ "$given_sha_sum" == "$file_sha_sum" ]
then
	echo "checksum match."
else
	echo "checksum mismatch."
fi
