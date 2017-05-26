#author: fazlerabbi37

#python script name: speed_tester.py

#the purpose of the python script is to test the network speed by downloading a file of 5MB.

#!/usr/bin/python3

#import
import requests
import time
import os

#print a message
print("downloading a standard 5MB zip file...")

#download a file form thinkbroadband.com and find out its download time with time.time() function
start_time = time.time()
url = 'http://download.thinkbroadband.com/5MB.zip'
file_name = '5MB.zip'
req = requests.get(url)
file = open(file_name, 'wb')
down_time=(time.time() - start_time)
kbps = (5120/down_time)
print("it took " +str(round(down_time,2))+" seconds to download the file at an average speed of "+str(round(kbps,2))+" kbps")

#show info as notification

#remove downloaded file
os.remove(file_name)
