#!/bin/bash

# Ask what folder user wants to use
read -p 'What folder are you using?: ' folderVar
# Check if folder exists
if [ -d "$folderVar" ]; then
    echo "Carry on"
else
    echo "Not a folder"
    exit 0
fi
# Check if password protected
cd $folderVar
if [ -e secret.txt ]; then
    # Check users credentials
    read -s -p 'Type a secret password: ' secretPassword # take password input from user
    echo $secretPassword | sha256sum > secret.sha256 # hash the input from the user and store in file
    PasswordHash=secret.txt
    PasswordTry=secret.sha256
    if cmp -s "$PasswordHash" "$PasswordTry"; then
        echo "Access granted"
    else
        echo "Access denied"
        exit 1
    fi
else
    echo "folder is not password protected"
fi
cd .. # Come back to parent directory
# Show the main menu
status=$?
if test $status -eq 0 ;then
	echo "1. Create a folder"
	echo "2. Copy a folder"
	echo "3. Set a password"
    echo "4. Calculator"
    echo "5. Create Week Folders"
    echo "6. Check Filenames"
    echo "7. Download a file"
    echo "8. Exit"
else
	echo "Goodbye"
fi
echo "select an option"
# take the user input of what option they selected
read -p 'enter here: ' option
echo "your option was ${option}"
if test $option -eq 1; then
	read -p "type the name of the folder you would like to create: " folderName
    mkdir "$folderName"
elif test $option -eq 2; then
    read -p "type the name of the folder you would like to copy: " folderName
    #if the name is a valid directory
    if [ -d "$folderName" ]; then
    #copy it to a new location
    read -p "type the name of the destination folder: " newFolderName
    cp -r "$folderName" "$newFolderName"
    else
    #otherwise, print an error
    echo "I couldn't find that folder"
    fi
elif test $option -eq 3; then
	read -p 'Type a folder name: ' folderName  #Get the new folder name from the user.
    if [ -d "$folderName" ]; then #check if folder already exists
        cd "$folderName" # if exists move into it
    else
        mkdir "$folderName" # Create the new folder using the user's input.
        cd "$folderName" #and move into new folder
    fi
    read -s -p 'Type a secret password:' secretPassword # Get a password from the user while hiding the input.
    echo "$secretPassword" | sha256sum  > secret.txt # Save a hashed version of the passowrd in a file in the new directory.
elif test $option -eq 4; then
    ./calculator.sh
elif test $option -eq 5; then
    ./megafoldermaker.sh
elif test $option -eq 6; then
    ./filenames.sh
elif test $option -eq 7; then
    ./InternetDownloader.sh
elif test $option -eq 8; then
    exit 0
else
	echo "not valid input"
fi