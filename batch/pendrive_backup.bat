::author: fazlerabbi37

::batch scritp name

::the purpose of the script is to sync my pendrive with my local drive

@echo off

::ask and save the pen drive letter to the variable source as it may change 
set /P source=Pen Drive Letter:

::hard code backup location to save in variable destination 
set destination=path\to\destination

::call robocopy function with source and destination with option /e /mir
robocopy %source%:\ %destination% /e /mir
