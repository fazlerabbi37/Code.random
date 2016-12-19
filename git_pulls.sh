#author: fr37

#!/bin/bash

#git_pulls.sh

#the purpose of the shell script is to git pull in all existing repos

echo "Enter project location:"
read pro
echo $pro


for d in $pro/*/
do
     (cd "$d" && echo $d  && git pull)
done
