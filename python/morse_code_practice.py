#author: fazlerabbi37

#python script name: morse_code_practice.py 

#the purpose of the python script is to generate random string of pre defind length and check if the user can recognize the stings morse code 

#!/usr/bin/python3

#imports
import random
import sys
import os

#global user_given_char_list
user_given_char_list = []

#char list
lower_alpha = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
num = ["0","1","2","3","4","5","6","7","8","9"]
pun = [",",":","?","'","-","/","?","@","="]

#define string_gen function that takes a list of char and password length and generates random string
def string_gen(input_char_list,pass_length):
	#remove duplicates
	char_list = list(set(input_char_list))
	random_string = ""
	for i in range(pass_length):
		random_string = random_string + random.SystemRandom().choice(char_list)
	return random_string

#define clear function
def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

#define manual_input function that asks user to input character
def manual_input():
	global user_given_char_list
	print("Enter the character(s) you want to practice seperated by space:")
	manual_char = input()
	chars = manual_char.split(" ")
	for char in chars:
		if char != "":
			user_given_char_list.append(char)

#ask user for char list
print("Option 1:")
print("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
print("Option 2:")
print("0","1","2","3","4","5","6","7","8","9")
print("Option 3:")
print(",",":","?","'","-","/","?","@","=")
print("Option 4:")
print("User chosen character(s).")

print("Choose character(s) for practice. You can choose multipul option.")
print("Type option number(s) seperat them by space. [i.e. 1 2] to choose option:")

user_given_set_number = input()
user_given_set_number_list = user_given_set_number.split(" ")
#if user gives space in between numbers
if user_given_set_number_list[-1] == "":
	del user_given_set_number_list[-1]
for i in user_given_set_number_list:
	if i == "1":
		user_given_char_list.extend(lower_alpha)
	elif i == "2":
		user_given_char_list.extend(num)
	elif i == "3":
		user_given_char_list.extend(pun)
	elif i == "4":
		manual_input()
	else:
		print('\033[91m' + "Error!!! input must be in between 1 and 4. Try again" + '\033[0m')
		sys.exit()

#ask user for string length
string_lenght = int(input("Enter the string length: "))
print("")

print("Randomly generated string: ",end='')
random_string = string_gen(user_given_char_list,string_lenght)
print("eeeeeeeeee "+random_string)
print("Don't worry about the 'eeeeeeeeee' now!\n")

print("Head over to https://morsecode.scphillips.com/trainer.html and find the Free-form section.")
print("Paste the andomly generated string on the text field, press Play and come back here.")
print("You should hear 10 dits... before starting the actual code. The e's were added for that reason.\n")

input("Press Enter to continue...")
clear()

user_input = input("Play the code and type what you hear\nGive space to skip a letter: ")
print(user_input)

length = 0

if len(random_string) > len(user_input):
    length = len(random_string)
else:
    length=len(user_input)
try:
    for i in range(length):
        print(random_string[i]+" -> "+user_input[i], end='')
        if random_string[i] == user_input[i]:
            print("    right")
        else:
        	print("    wrong")
except IndexError:
	print("Randomly generated string and User input's length mismatched !!!")
