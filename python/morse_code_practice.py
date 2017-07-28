#author: fazlerabbi37

#python script name: morse_code_practice.py 

#the purpose of the python script is to generate random string of pre defind length and check if the user can recognize the stings morse code 

#!/usr/bin/python3

#imports
import random
import sys
import os

#define string_gen function that takes a list of char and password length and generates random string
def string_gen(char_list,pass_length):
    random_string = ""
    for i in range(pass_length):
        random_string = random_string + random.SystemRandom().choice(char_list)
    return random_string

#define clear function
def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

#ask user for char list
#ask user for string length

user_given_char_list = ['e','t','i','5']
string_lenght = int(input("Enter the string length: "))
print("")

print("Randomly generated string: ",end='')
random_string = string_gen(user_given_char_list,string_lenght)
print("eeeeeeeeee "+random_string)
print("Don't worry about the 'eeeeeeeeee' now!\n")

print("Head over to https://morsecode.scphillips.com/trainer.html and find the Free-form section.")
print("Paste the andomly generated string on the text field, press Play and come back here.")
print("You should hear 10 dits... before starting the actual code. The e's ware added for that reason.\n")

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
