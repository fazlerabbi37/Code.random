::author: fazlerabbi37

::get_nano_cmd.bat

::the purpose of the batch script is to get nano text editor in cmd

@echo off

::show warning  and pause
echo WARNING !!!
echo Please run script as administrator...
echo if you are not run as administrator, close the program and run as administrator
echo script will not work if you don't run as administrator.
pause 

::chnage directory to C:\Users\%username%\
cd C:\Users\%username%\


::make directory in C:\Users\%username%\ named get_nano
mkdir get_nano


::chnage directory to C:\Users\%username%\get_nano
cd get_nano


::downlaod nano.zip form sourceforge
echo Downloading nano.zip...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://netcologne.dl.sourceforge.net/project/nano/nano/1.0.8/nano-1.0.8.zip', 'nano.zip')"


::downlaod unzip.rar form sourceforge
echo Downloading unzip.rar...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/fr37portableapps/files/Others/unzip.rar', 'unzip.rar')"



::rename unzip.rar to unzip.exe and  unzip nano.zip with unzip.exe
rename unzip.rar unzip.exe
unzip.exe nano.zip -d nano

::pause for a moment
pause

::copy files to C:\Windows
echo copying files to System drive...
copy %cd%\nano\cygwin1.dll C:\Windows
copy %cd%\nano\nano.exe C:\Windows



::delete nano file
cd C:\Users\
rmdir /S /Q "C:\Users\%username%\get_nano"

::echo done and pause
echo Done !
pause