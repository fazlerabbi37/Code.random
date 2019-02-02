#author: fazlerabbi37

#python script name: budget_watch_to_gnucash.py

#the purpose of the python script is to convert Budget Watch app's csv file dump into GnuCash's 'Transactions from CSV' readable format 

#!/usr/bin/python3

import time

file_name="BudgetWatch.csv"

lines_list = open(file_name).read().splitlines()

f = open('budget_watch_in_gnucash_format.csv', 'w')

for lines in lines_list:
    line_array = lines.split(",")
    id = line_array[0]
    if id.isdigit(): 
        gnucash_export_line = []
        epoch_date_in_ms = line_array[7]
        epoch_date = epoch_date_in_ms[:-3]
        date = time.strftime("%Y-%m-%d", time.gmtime(int(epoch_date)))
        gnucash_export_line.append(date)
        gnucash_export_line.append(line_array[2])
        gnucash_export_line.append(line_array[3])
        gnucash_export_line.append(line_array[4])
        gnucash_export_line.append(line_array[5])
        gnucash_export_line.append(line_array[6])
        gnucash_export_line.append(line_array[10])
        print(', '.join(gnucash_export_line), file=f)
print("Conversion complete!")
print("Now import GnuCash to export the 'budget_watch_in_gnucash_format.csv' file.")
print("Select 1st column as Date, 2nd column as Description, 3rd column as Account, 4th column as Transfer Account, 5th column as Withdraw, 6th column as Note and 7th column as Memo")

        
        
        
        
