#author: fazlerabbi37

#set_custom_shortcut_key.sh

#the purpose of the shell script is to set castom key in Ubuntu

#!/bin/bash


#function instructions show how to set a castom key
function instructions () {
	printf "#file name: shortcut_key.txt\n#purpose: set custom shortcut key\n"
	printf "#Press ctrl+o to save.\n#Press ctrl+x to finish editing.\n\n"
	printf "#------------------------------------------instructions----------------------------------------------#\n\n"

	printf "#READ THIS INSTRUCTION CAREFULLY!!!\n"
	printf "#To enable this script to set custom shortcut key at first add a key using GUI which you can delete later.\n"
	printf "#Go to dashboard, search Keyboard, double click on the Keyboard icon.\n"
	printf "#After opening the Keyboard app, click on Shortcuts tab, click on Castom Shortcuts, then click on the + button at the bottom.\n"
	printf "#A pop-up appears with two field, Name and Command.\n"
	printf "#Type the word without quote 'test' on both field and return to this file to add shortcut.\n\n"

	printf "#mostly used keys:\n"
	printf "#Super key:\t\t\t\t<Super>\n"
	printf "#Control key:\t\t\t\t<Primary> or <Control>\n"
	printf "#Alt key:\t\t\t\t<Alt>\n"
	printf "#Shift key:\t\t\t\t<Shift>\n"
	printf "#numbers:\t\t\t\t1 (just the number)\n"
	printf "#Spacebar:\t\t\t\tspace\n"
	printf "#Slash key:\t\t\t\tslash\n"
	printf "#Asterisk key:\t\t\t\tasterisk (so it would need \`<Shift>\` as well)\n"
	printf "#Ampersand key:\t\t\t\tampersand (so it would need <Shift> as well)\n\n"

	printf "#a few numpad keys:\n"
	printf "#Numpad divide key (\`/\`):\t\tKP_Divide\n"
	printf "#Numpad multiply (Asterisk):\t\tKP_Multiply\n"
	printf "#Numpad number key(s):\t\t\tKP_1\n"
	printf "#Numpad \`-\`:\t\t\t\tKP_Subtract\n\n"

	printf "#setting a castom keyboard shortcut\n"
	printf "#generic\n\t#'<name>' '<command>' '<key_combination>'\n"
	printf "#gedit\n\t#'open gedit' 'gedit' '<Alt>7'\n\n"
	printf "#put one  in one line\n"
	printf "#give space in between '<name>' '<command>' '<key_combination>'\n#i.e. '<name>'|space|'<command>'|space|'<key_combination>'\n\n"

	printf "#----------------------------------------------------------------------------------------------------#\n"
	printf "\n\t\t\t\t\t#Edit form here#\n"
	printf "#----------------------------------------------------------------------------------------------------#\n"
        printf "#User added shortcut key(s):\n"
}

#function set_key reads line form file shortcut_key.txt and sets the shortcut key
function set_key () {
    linesToSkip=46
    {
        for ((i=$linesToSkip;i--;)) ;do
            read
            done
        while read line ;do
            eval $(echo "python3 set_custom_shortcut_key.py $line")
            done
    } < "shortcut_key.txt"
}

#check if xdotool is installed; if not ask to press enter to exit
xdotool=$(which xdotool)
if [[ ! -z "$xdotool" ]]
then
    echo -e "\e[32mxdotool is installed.\e[0m"
else
    echo -e "\e[31mxdotool is not installed!!!\e[0m"
    echo "open a terminal, type without quote \'sudo apt-get install xdotool\', press enter to install xdotool then run the script again."
    read -p "Press Enter to exit"
    kill $$
fi

#check if python3 is installed; if not ask to press enter to exit
python=$(which python3)
if [[ ! -z "$python" ]]
then
    echo -e "\e[32mpython3 is installed.\e[0m"
    echo "Downloading set_custom_shortcut_key.py file form github"
    wget -q https://raw.githubusercontent.com/fazlerabbi37/Code.random/master/python/set_custom_shortcut_key.py
    read -p "Press Enter to continue"
    if [ -f "shortcut_key.txt" ];
    then
        nano shortcut_key.txt
        read -p "Press Enter to continue"
	set_key
    else
	instructions>>shortcut_key.txt
    	nano shortcut_key.txt
	read -p "Press Enter to continue"
	set_key
    fi

else
    echo -e "\e[31mpython3 is not installed!!!\e[0m"
    printf "Please install python3 and run the script again.\n"
    read -p "Press Enter to exit"
    kill $$
fi

rm set_custom_shortcut_key.py

echo "All custom shortcut keys are set"
DISPLAY=:0.0 /usr/bin/notify-send "All custom shortcut keys are set"
spd-say "All custom shortcut keys are set"
