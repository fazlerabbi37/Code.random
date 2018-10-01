#author: fazlerabbi37

#python script name: snack_picker.py

#the purpose of the python script is to pick random snack

#!/usr/bin/python3

from random import randint

food_list = ['Cake + Banana', 'Noodles', 'Fruits', 'Sandwich', 'Fried Snacks', 'Puffed Rice', 'Patties', 'Pizza Sliced', 'Checken Fry']

print("First choice: "+food_list[randint(0, len(food_list) - 1)])
print("Second choice: "+food_list[randint(0, len(food_list) - 1)])

