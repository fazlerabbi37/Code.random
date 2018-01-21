#author: fazlerabbi37

#source: https://askubuntu.com/a/741685/502875

#shell script name: run_google_chrome_app.sh

#the purpose of the shell script is take a Google Chorme App name, search for it in and run it if available

#!/bin/bash

#export display at 0
export DISPLAY=:0

#Google Chrome App's .desktop files location
app_dir="$HOME/.local/share/applications"

#change directory to app_dir
cd $app_dir


if [[ "$#" == 0 ]]
then
    echo "List of all abilable Google Chrome apps.."
    for desktop_file in $(ls chrome-*)
    do
        chrome_desktop_file=$(cat $desktop_file | grep "Name" | sed 's/^.....//')
        echo $chrome_desktop_file
    done
    echo
    echo "Enter the app you want to run:"
    read app
else
    app="$1"
fi



#check if Google Chrome is in /opt/google/chrome/google-chrome
if [ -f /opt/google/chrome/google-chrome ]
then
    echo "Google Chrome is found in /opt/google/chrome/google-chrome..."
    echo ""
else
    echo "Google Chrome is not found in /opt/google/chrome/google-chrome..."
    echo ""
fi

for desktop_file in $(ls chrome-*)
do
    chrome_desktop_file=$(cat $desktop_file | grep "Name" | sed 's/^.....//')
    if [[ "$(echo "$chrome_desktop_file" | tr '[:upper:]' '[:lower:]')" == *"$app"* ]]
    then
        prefix="chrome-"
        suffix="-Default.desktop"
        desktop_file=${desktop_file#$prefix}
        chrome_app_id=${desktop_file%$suffix}

        #lunch the app
        echo "Starting $chrome_desktop_file..."
        google-chrome --app-id=$chrome_app_id >> /dev/null 2>&1

    fi
done
