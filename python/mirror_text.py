#author: fazlerabbi37

#source: A.K.M. Nivrito

#python script name: mirror_text.py 

#the purpose of the python script is to mirror the given input text

#!/usr/bin/python3

#ask user for input message
message = input("Enter message:\n")

#declare variable output and assign ""
output = ""

#for loop to reverse iterate the string
for ch in message[::-1]:
    output = output + ch

#print outpur
print(output)
