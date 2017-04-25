#author: fazlerabbi37

#name: guess_the_number.py

#the purpose of the python script is to play guess the number

#!/usr/bin/env python3

import random

secret_number = random.randint(1,20)
print('I am thinking a number in between 1 to 20.')

for guess_attempt in range(1,7):
	print('Care to guess?')
	guess=int(input())
	
	if guess < secret_number:
		print ('Your guess is too low...')
	elif guess > secret_number:
		print ('Your guess is too high...')
	else :
		break
	
if guess == secret_number:
	print ('You guessed correct. You took ' + str(guess_attempt) + ' attempts to guess the number.')
else :
	print('Nope. I was thinking the number ' + str(secret_number))	
