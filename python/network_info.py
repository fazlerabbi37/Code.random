#https://www.raspberrypi.org/forums/viewtopic.php?f=36&t=96889#

#!/usr/bin/python3
import socket
import os
from urllib.request import urlopen
import json

gw = os.popen("ip -4 route show default").read().split()
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect((gw[2], 0))
ipaddr = s.getsockname()[0]
gateway = gw[2]
host = socket.gethostname()
ip = urlopen('http://httpbin.org/ip').read()
ip = ip.decode('utf-8')
ip = json.loads(ip)
try:
  name, alias, addresslist = socket.gethostbyaddr(ip['origin'])
except:
  name, alias, addresslist = ["Unknown","Unknown","Unknown"]

print ("IP:", ipaddr)
print ("Gateway:", gateway)
print ("Host:", host)
print("Public IP:",ip['origin'])
print ("Domain:",name)
