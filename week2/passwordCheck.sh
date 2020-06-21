#!/bin/bash
# Ask the user to type a secret password (hide that input)
read -s -p 'Type a secret password: ' secretPassword # take password input from user

echo $secretPassword | sha256sum > secret.sha256 # hash the input from the user and store in file
mv secret.sha256 test
cd test
# Check the user's password against the hash stored in secret.txt
PasswordHash=secret.txt
PasswordTry=secret.sha256
if cmp -s "$PasswordHash" "$PasswordTry"; then
	echo "Access granted"# If the users password is correct, print "Access Granted" and quit with the exit code 0
	exit 0
else
	echo "Access denied"# If the users password is incorrect print "Access Denied" and quit with the exit code 1.
	exit 1
fi