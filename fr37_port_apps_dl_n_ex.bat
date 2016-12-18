::author: fr37

::fr37_port_apps_dl_n_ex.bat

::The purpose of the batch file is to download applications form fr37portableapps and if necessary extract and create shortcut
::@echo off

::try to finish the download while showing the message 
::show getting ready message
echo "Downloading tools and getting ready"

::download UnRAR.exe
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/fr37portableapps/files/Others/UnRAR.exe/download', '%cd%\unrar.exe')"
::download Shortcut.exe
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/fr37portableapps/files/Others/Shortcut.exe/download', '%cd%\shortcut.exe')"

echo go to this:https://sourceforge.net/p/fr37portableapps/wiki/PortableApps%20List/ link to see all apps separated by sourceforge folder
::ask and trigger defult browser


::ask and save sourceforge folder name (e.g. Windows, Others, APK, PAF, Ubuntu) in fol_loc variable
set /p fol_loc=Enter sourceforge folder name (e.g. Windows, Others, APK, PAF, Ubuntu):
::ask and save application name with extension (e.g. FileZill.rar, Allo.apk) in app_name variable 
set /p app_name=Enter app name with extension (e.g. FileZill.rar, Allo.apk):
::ask and save download directory in dl_loc variable
set /p dl_loc=Enter the directory you want you app to be downloaded (e.g. C:\Users\user\Downloads\ or D:\my file\down\):

::download target application to download location
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/fr37portableapps/files/%fol_loc%/%app_name%/download', '%dl_loc%%app_name%')"

::unrar function, asks for if want to extract or not
:unrar
set /P d=Is it a .rar file that you want to unrar?[Y/N]?
if /I "%d%" EQU "Y" unrar x "%dl_loc%%app_name%" "%dl_loc%" 
::call:shortcut
if /I "%d%" EQU "N" echo ok

::many .exe file name in fr37portableapps is not same as the .rar file so creating shortcut is bit trouble some
:: for example, upon extracting FileZilla.rar in FileZilla folder we get FileZillaPortable.exe
::the huge project will take time to get the standard form of  FileZilla.exe in FileZilla.rar
::for the time being shortcut function will be inactive 
::shortcut
::set /P s=Do you want to create shortcut?[Y/N]?
::echo Warning!!! Process will create wrong shortcut if any .exe is not found in ../App Name/ directory
::pause
::if /I "%s%" EQU "Y" set /p short_loc=Enter the location where to create shortcut:
::if /I "%s%" EQU "N" echo ok
::shortcut /a:c /f:"%short_loc%/%app_name%.lnk" /t:"%dl_loc%\%app_name%\%app_name%" ::app_name after dl_loc has .extension at last that need to remove 

::delete funcation, asks for if want to delete downloaded file
:delete
set /P d=Do you want to delete the downloaded file?[Y/N]?
if /I "%d%" EQU "Y" del /Q "%dl_loc%%app_name%" 
if /I "%d%" EQU "N" echo ok
pause
::delete unrar.exe
del /Q "%cd%\unrar.exe"
::delete shortcut.exe
del /Q "%cd%\shortcut.exe"