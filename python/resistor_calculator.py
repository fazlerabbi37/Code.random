#author: fazlerabbi37

#python script name: resistor_calculator.py

#the purpose of the python script is to calculate resistor value (you can trick it to calculate capacitor as well)

#!/usr/bin/python3


#ask for user input and save it in user_input
user_input = input("Enter the resistor values separated by comma:\n")
print("Your input: "+user_input)

#separate the values by comma and save it in list resistors
resistors = user_input.split(',')


#define total_resistance_in_series that will calculate total resistance in series
def total_resistance_in_series():
    total_resistance = 0
    for resistor in resistors:
        total_resistance = total_resistance + int(resistor)
    print("Total resistance in series: "+str(total_resistance))


#define total_resistance_in_parallel that will calculate total resistance in parallel
def total_resistance_in_parallel():
    total_resistance = 0
    for resistor in resistors:
        total_resistance = total_resistance + int(resistor)**-1
    total_resistance = total_resistance**-1
    print("Total resistance in parallel: "+str(total_resistance))


total_resistance_in_series()
total_resistance_in_parallel()
