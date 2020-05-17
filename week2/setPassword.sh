#!/bin/bash
read -p 'Type a folder name: ' folderName  #Get the new folder name from the user.
mkdir "$folderName" # Create the new folder using the user's input.
cd "$folderName" # Move into the newly created directory.
read -s -p 'Type a secret password:' secretPassword # Get a password from the user while hiding the input.
echo "$secretPassword" | sha256sum  > secret.txt # Save a hashed version of the passowrd in a file in the new directory.



