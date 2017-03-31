::author: wikihow

::batch script name:  hidden_user.bat

::the purpose of the batch script is to create a Administrators in Windows

@echo off

::change user name and password by replacing hidden and passwordhere

::add user with name hidden and password passwordhere 
net user hidden passwordhere /add


::add user hidden to Administrators group
net localgroup Administrators hidden /add
