#author: fazlerabbi37

#shell script name: local_git_server.sh

#the purpose of the shell script is to configure a local basic git server

#!/bin/bash

#install sudo apt-get install git-core in both machine

#var
arg=""
local_username=""
local_ip=""
local_port=""
remote_server_username=""
remote_server_ip=""
remote_server_port=""

user_input(){

    #echo some message
    echo "Welcome to Local Git Server !!!"
    echo "We are assuming you have a machine on the LAN which we will call 'remote server' with openssh-server and git enabled."
    echo "We are also assuming that the 'remote server', your machine is assigned to two seperate static IP and you also have a user created on that remote server"
    printf "\n"

    #find the current user of the local machine
    local_username=$(whoami)

    #find IP of the local machine IP
    local_ip=$(hostname -I)

    #find the ssh port
    local_port=$(cat /etc/ssh/sshd_config | grep "^Port" | awk {'print $2'})

    #show the user name and ip address and ask if they want to use it or not
    echo "The current user of this machine is: $local_username"
    echo "The IP address of this machine is: $local_ip"
    echo "The SSH port of this machine is: $local_port"


    read -p "Do you want to stick to the found IP, user name and port?[y/n]: " option

    if [[ $option == 'y' ]]
    then
        echo "Local machine user set to: $local_username"
        echo "Local machine IP set to: $local_ip"
        echo "Local machine SSH port set to: $local_port"

    else
        echo "Enter your username of your local machine:"
        read local_username
        echo "Enter the IP address of your local machine:"
        read local_ip
        echo "Enter the ssh port number of the local machine:"
        read local_port

    fi

    echo "Enter the user name for the remote server:"
    read remote_server_username

    echo "Enter the remote server address:"
    read remote_server_ip

    echo "Enter the ssh port number of the remote server:"
    read remote_server_port


    #make a file $HOME/.lgs_conf and write all varables to $HOME/.lgs_conf file

    touch $HOME/.lgs_conf
    echo "local_username=$local_username" >> $HOME/.lgs_conf
    echo "local_ip=$local_ip" >> $HOME/.lgs_conf
    echo "local_port=$local_port" >> $HOME/.lgs_conf
    echo "remote_server_username=$remote_server_username" >> $HOME/.lgs_conf
    echo "remote_server_ip=$remote_server_ip" >> $HOME/.lgs_conf
    echo "remote_server_port=$remote_server_port" >> $HOME/.lgs_conf

}



confiig(){

    #ask user to give the location of .ssh folder
    echo "Enter the location of .ssh folder [Normally it is in $HOME/.ssh if you haven't changed] :"
    read ssh_folder
    pub="$ssh_folder/id_rsa.pub"
    pri="$ssh_folder/id_rsa"

    if [ -f "$pub" ] && [ -f "$pri" ]
    then
	    ssh-copy-id -i $pri $remote_server_username@$remote_server_ip -p $remote_server_port
    else
	    ssh-keygen
        ssh-copy-id -i $pri $remote_server_username@$remote_server_ip -p $remote_server_port
    fi

    ssh $remote_server_username@$remote_server_ip -p $remote_server_port "if [ -d $HOME/local_git_server ]; then     echo \"remote server directory found...\"; else     echo \"remote server directory not found...\";     echo \"creating directory...\";     mkdir $HOME/local_git_server; fi"

}



read_config(){

    if [[ -f $HOME/.lgs_conf ]]
    then
         . $HOME/.lgs_conf
    else
        user_input
        confiig
    fi

}

add_repo(){

    echo "Enter the path of the directory you want to add to the remote server:"
    read local_dir_path
    local_dir_name=$(basename $local_dir_path)

    if [ -d $local_dir_path/.git ]
    then

        echo "A Git repository already exist in this directory"
        ssh $remote_server_username@$remote_server_ip -p $remote_server_port "if [ -d $HOME/local_git_server/$local_dir_name.git ]; then     echo \"The repository $local_dir_name already exists on the remote server.\"; else    echo \"Creating $local_dir_name repository on the remote server.\";     cd $HOME/local_git_server;    git clone --bare ssh://$local_username@$local_ip:$local_port/$local_dir_path ; fi"

        #add remote with name local_git_server
        cd $local_dir_path; git remote add local_git_server ssh://$remote_server_username@$remote_server_ip:$remote_server_port/$HOME/local_git_server/$local_dir_name.git


    else
        echo "No git repo found..."
        read -p "Do you want to init git repo in this directory? [y/n]: " option
        if [[ $option == "y" ]]
        then
            cd $local_dir_path && git init

            ssh $remote_server_username@$remote_server_ip -p $remote_server_port "if [ -d $HOME/local_git_server/$local_dir_name.git ]; then     echo \"The repository $local_dir_name already exists on the remote server.\"; else    echo \"Creating $local_dir_name repository on the remote server.\";     cd $HOME/local_git_server;    git clone --bare ssh://$local_username@$local_ip:$local_port/$local_dir_path ; fi"

            #add remote with name local_git_server
            cd $local_dir_path; git remote add local_git_server ssh://$remote_server_username@$remote_server_ip:$remote_server_port/$HOME/local_git_server/$local_dir_name.git


        elif [[ $option == "n" ]]
        then
            kill $$
        else
            echo -e "\e[31mError!!! Enter either 'y' or 'n'\e[0m"
        fi
    fi

}

read_config
add_repo
