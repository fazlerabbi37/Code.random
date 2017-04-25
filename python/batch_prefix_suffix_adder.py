#author: fazlerabbi37

#python script name: batch_prefix_suffix_adder.py

#the purpose of the python script is to add prefix or suffix, before or after al the line in a file

#!/usr/bin/python3


#imports
import os


#global variable
lines = []
file_name = ""


#function for adding prefix to string
def prefix ():
    #ask for prefix to add with string
    pre = input("Enter the prefix you want to add: ")
    for counter in range(len(lines)):
        line = lines[counter]
        lines[counter] = ""
        with_pre = pre+line
        lines[counter] = with_pre
    prefixed_file = "prefixed_"+file_name
    with open (prefixed_file,"w")as fp:
        for line in lines:
            fp.write(line+"\n")
    print("File created with name: "+prefixed_file)

#function for adding suffix to string
def suffix ():
    #ask for suffix to add with string
    suf= input("Enter the suffix you want to add: ")
    for counter in range(len(lines)):
        line = lines[counter]
        lines[counter] = ""
        with_suf = line+suf
        lines[counter] = with_suf
    suffixed_file = "suffixed_"+file_name
    with open (suffixed_file,"w")as fp:
        for line in lines:
            fp.write(line+"\n")
    print("File created with name: "+suffixed_file)


#function for taking a file and performing acction, either prefix or suffix
def batch_prefix_suffix_adder ():
    global lines, file_name
    file_location = input("Enter file location:\n")
    file_name = os.path.basename(file_location)
    lines = open(file_location).read().splitlines()
    option = input("Enter p for prefix and s for suffix: ")
    if option is 'p':
        prefix()
    elif option is 's':
        suffix()
    elif option is not 'p' or 's':
        print('\033[91m'+"Error! Enter without quote 'p' or 's'"+'\033[0m')

  
#call batch_prefix_suffix_adder function
batch_prefix_suffix_adder()
