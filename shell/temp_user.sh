#author: fazlerabbi37

#name: temp_user.sh

#the purpose of the shell script is to create a temporary user in Linux system

#!/bin/bash


#ask user to run the script with admin privilage
echo "Run the script with admin privilage..."

#ask and read user name, save it in var $user_name (if possibale try to pass by argument)
echo "Enter the user name:"
read user_name

#ask and read expire time, save it in var $time and set $#exp_time
#echo "Enter expire time(i.e. 1 day, 1 month):"
#read time
#exp_time=

#save "_guest" string in var guest_string
guest_string="_guest"

#concat var user_name and var guest_string and save it in var guest_user_name
guest_user_name=$user_name$guest_string

#add user with guest_user_name
useradd -m $guest_user_name

#create password for user
echo $guest_user_name:$user_name | sudo chpasswd

#save "delete_" string in var delete_string
delete_string="delete_"

#concat var user_name and var delete_string and save it in var delete_user_name
delete_user_name=$delete_string$user_name

#create Desktop direcotry for user
mkdir /home/$guest_user_name/Desktop

#create a README.txt asking to change password
printf "PLEASE READ THIS. IT IS IMPORTANT !!!\n\n" >> /home/$guest_user_name/Desktop/README

printf "The default user name for your account is your name_guest (i.e. fazlerabbi_guest)\n\n" >> /home/$guest_user_name/Desktop/README

printf "The default password for you account is your name (i.e. fazlerabbi)\n\n" >> /home/$guest_user_name/Desktop/README

printf "Please change it.\n\n" >> /home/$guest_user_name/Desktop/README

printf "To change your password\n\n" >> /home/$guest_user_name/Desktop/README

printf "\t1. Using terminal: open terminal and type without quote 'passwd'. It will ask for current password.Type your password and press enter.\n\t   Enter new password, reenter new password. Voila, you are set !\n\n" >> /home/$guest_user_name/Desktop/README

printf "\tOR\n\n" >> /home/$guest_user_name/Desktop/README

printf "\t2. Using GUI: Go to System Settings -> User Accounts. In left side you will see \"My account\", under which you shoud see your user name.\n\t   In right side you will see some basic information. Find Passowrd field and click on the '.....', a popup should open asking\n\t   \"Current password\", \"New password\" and \"Confirm password\". Fill them up press change and you are done.\n\n" >> /home/$guest_user_name/Desktop/README
printf "Secure user, Happy user :)\n" >> /home/$guest_user_name/Desktop/README


#create a delete_user_name.sh in root's home directory
printf "#author: fazlerabbi37\n\n#name: temp_user.sh\n\n#the purpose of the shell script is to detele a temporary user in Linux system\n\n" > /root/$delete_user_name.sh

echo '#!/bin/bash' >> /root/$delete_user_name.sh

printf "\n#delete user\nuserdel $guest_user_name\n\n" >> /root/$delete_user_name.sh

printf "#delete home directory\nrm -rf /home/$guest_user_name\n\n" >> /root/$delete_user_name.sh

printf "#delete this shell\n" >> /root/$delete_user_name.sh

echo 'rm -- "$0"' >> /root/$delete_user_name.sh

#make delete_user_name.sh executable
chmod +x /root/$delete_user_name.sh

#give msg saying temporary user added
echo "Temporary user added"
DISPLAY=:0.0 /usr/bin/notify-send "Temporary user added"
spd-say "Temporary user added"
