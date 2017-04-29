#author: fazlerabbi37

#source: http://stackoverflow.com/a/3431838/5350059

#python script name: checksum_match.py

#the purpose of the python script it to match checksum of a given file

#!/usr/bin/python3


#imports
import hashlib


#print all hashing algorithm avalible
print("All hashing algorithm avalible in the system:")
print(hashlib.algorithms_available)


#ask for a hashing algorithm
algo = input("Enter the hashing algorithm you want to use form above set (i.e sha256):\n")

#ask for a file path
file_location = input("Enter file path:\n")

#get the hash name form input algo
hash_name = hashlib.new(algo)


#generate hash
print("Generating "+algo+" hash for the given file...")
with open(file_location, "rb") as f:
    for chunk in iter(lambda: f.read(4096), b""):
        hash_name.update(chunk)
generated_hash = hash_name.hexdigest()
print("Generated file hash: "+generated_hash)

#ask if want to check the hash with any given hash
check_with_given = input("Do you wnat to check generated hash with any geven hash?(yes/no)\n").lower()
if check_with_given == "yes":
    given_hash = input("Enter the given hash:\n")
    if generated_hash == given_hash:
        print("Hash matched.")
    else:
        print("Hash mismatched.")
elif check_with_given == 'no':
    print("bye")
    
