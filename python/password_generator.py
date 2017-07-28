#author: fazlerabbi37

#python script name: password_generator.py

#the purpose of the python script is to generate random password given the password length and character sets

#!/usr/bin/python3

#imports
import random
import sys

#define empty user_given_char_list and password_lenght
user_given_char_list = []
password_lenght = 0

#all available character list
upper_alpha = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
lower_alpha = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
num = ["0","1","2","3","4","5","6","7","8","9"]
special = ["-","_",'!', '#', '$', '%', '&', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_', '`', '{', '|', '}', '~', '"', "'"]


#define print_char_set that prints all available character sets
def print_char_set():
    print("available character sets:")
    print("Set 1:")
    print("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
    print()
    print("Set 2:")
    print("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
    print()
    print("Set 3:")
    print("0","1","2","3","4","5","6","7","8","9")
    print()
    print("Set 4:")
    print("-","_",'!', '#', '$', '%', '&', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_', '`', '{', '|', '}', '~', '"', "'")
    print()
    print()

#defince user_input that asks for character set numbers and password length
def user_input():
    print("Enter the number(s) of character set(s) you want to use, seperat them by space. [i.e. 1 2]:")
    user_given_set_number = input()
    user_given_set_number_list = user_given_set_number.split(" ")
   
     #if user gives space in between numbers
	if user_given_set_number_list[-1] == "":
        del user_given_set_number_list[-1]
    
    global user_given_char_list
    for i in user_given_set_number_list:
        if i == "1":
            user_given_char_list.extend(upper_alpha)
        elif i == "2":
            user_given_char_list.extend(lower_alpha)
        elif i == "3":
            user_given_char_list.extend(num)
        elif i == "4":
            user_given_char_list.extend(special)
        else:
            print('\033[91m' + "Error!!! input must be in between 1 and 4. Try again" + '\033[0m')
            sys.exit()

    global password_lenght
    password_lenght = int(input("Password length: "))

#define pass_gen that takes two param char_list and pass_length and returns a string passwd
def pass_gen(char_list,pass_length):
    passwd = ""
    for i in range(pass_length):
        passwd = passwd + random.SystemRandom().choice(char_list)
    return passwd

#function calls
print_char_set()
user_input()
print("Password:\n"+ pass_gen(user_given_char_list,password_lenght))
print("")
