#author: fazlerabbi37

#python script name: path_converter.py 

#the purpose of the python script is to convert file path from UNIX to Windows and vice versa

#!/usr/bin/python3

#ask and read file path, save it to variable path
path = input("Enter file path:\n")

#ask and read source path type, save it to variable type
print("Enter source path type.")
type = input("Enter without quote, for UNIX 'u' and for Windows 'w': ")

#check type for u convert UNXI to Windows, for w convert Windows to UNIX, for all other show error message
if type == 'u':
    print("Converting UNIX path to Windows...")
    print(path.replace("/","\\"))
elif type == 'w':
    print("Converting Windows path to UNIX...")
    print(path.replace("\\","/"))
else:
    print('\033[91m' + "INVALID !!! type 'u' or 'w' without quote." + '\033[0m')
