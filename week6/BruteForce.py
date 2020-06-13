#!/usr/bin/python3
from itertools import product
import string
import hashlib

# Valid character set for passwords
charset = string.ascii_lowercase #+ string.digits  #uncomment "+ string.digits" if including digits
# Hidden password hash
passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
passwordLength = 5

def Brute_Force(passwordHash, passwordLength):
    # Loop through all combinations of lowercase letters a-z and digits 0-9
    for i in range(passwordLength+1):
        for attempt in product(charset, repeat=i):
            word = ''.join(attempt)
            # Hash each attempt as its generated and compare to the given hash
            wordHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
            #print(f"Trying password {word}: {wordHash}") #uncomment to print attempts but will run slower
            # If the hash is the same as the correct password's hash then we have cracked the password!
            if wordHash == passwordHash:
                return ''.join(attempt)

CrackedPassword = Brute_Force(passwordHash, passwordLength)
print(f"Password has been cracked! It was {CrackedPassword}")