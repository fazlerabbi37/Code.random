::author: fazlerabbi37

::batch script name: tree_loop

::the purpose of the batch script is to run tree command to a given number of time

@echo off

set /p number_of_loop="Please enter the number of time you want to run the tree command: "

echo %number_of_loop%

for /l %%n in (1,1,%number_of_loop%) do (
  tree c:\
  echo "====================================="
  sleep 1
  )


