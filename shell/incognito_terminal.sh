#author: fazlerabbi37

#shell script name: incognito_terminal.sh

#the purpose of the shell script is to delete all command history from .bash_history of a certain time 

#!/bin/bash

#copy the current .bash_history and name it .bash_history_history
cp $HOME/.bash_history $HOME/.bash_history_history

#open a new window of terminal
gnome-terminal

#wait until enter is pressed and do your dirty works on the newly opened terminal window
read -p "Press Enter to clear history..."

#when Enter is pressed restore the .bash_history_history to .bash_history
cp $HOME/.bash_history_history $HOME/.bash_history

#remove $HOME/.bash_history_history
rm $HOME/.bash_history_history
