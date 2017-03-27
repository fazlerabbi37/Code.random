#author: fazlerabbi37

#hiden_user.sh

#the purpose of the shell script is to create a hiden user in Gnome based Desktop Environment

#!/bin/bash

#ask user to run the script with admin privilage
echo "Run the script with admin privilage..."

#ask and read user name
echo "Enter the user name:"
read user_name

#add user with hidden home directory
useradd -m -d /.$user_name $user_name

#create password for user
sudo passwd $user_name

#add user to sudoers
usermod -aG sudo $user_name

#hide from login screen
touch $user_name
printf "[User]\nSystemAccount=true\n" > $user_name
sudo mv $user_name /var/lib/AccountsService/users/$user_name

#hide user from logout/switch
gsettings set com.canonical.indicator.session user-show-menu false
