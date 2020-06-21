#!/bin/bash

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
NC=$'\e[1;0m'
BLUE=$'\e[1;34m'
BLACK=$'\e[1;30m'
YELLOW=$'\e[1;33m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[1;36m'
GREY=$'\e[1;37m'

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
    RED=$'\e[1;31m'
    GREEN=$'\e[1;32m'
    NC=$'\e[1;0m'
    read -s -p ""$RED"Enter Password: "$NC"" secretPassword # take password input from user
    echo $secretPassword | sha256sum > secret.sha256 # hash the input from the user and store in file
    PasswordHash=secret.txt
    PasswordTry=secret.sha256
    if cmp -s "$PasswordHash" "$PasswordTry"; then
        echo -e "\n"$GREEN"Access granted "$NC""
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
    echo ""$BLUE"Select an Option: "
	echo ""$PURPLE"1. Create a folder"
	echo "2. Copy a folder"
	echo "3. Set a password"
    echo "4. Calculator"
    echo "5. Create Week Folders"
    echo "6. Check Filenames"
    echo "7. Download a file"
    echo ""$YELLOW"8. Exit"$NC""
else
	echo "Goodbye"
fi
# take the user input of what option they selected
read -p 'enter here: ' option
echo "your option was ${option}"
if test $option -eq 1; then
# Option 2 - Create a folder
    read -p "type the name of the folder you would like to create: " folderName
    mkdir "$folderName"
elif test $option -eq 2; then
# Option 2 - Copy a folder
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
# Option 3 - Set a Password
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
# Option 4 - Calculator
    youranswer=0
    read -p 'Enter first number: ' var1
    read -p 'Enter expression (+, -, *, /): ' expression
    read -p 'Enter second number: ' var2

    case $expression in
    "+" ) let youranswer=var1+var2 # Addition test
        echo $'\e[1;34m'$var1 + $var2 = $youranswer$'\e[0m'
    ;;
    "-" ) let youranswer=var1-var2 # Subtraction test
        echo $'\e[1;32m'$var1 - $var2 = $youranswer$'\e[0m'
    ;;
    "*" ) let youranswer=var1*var2 # Multiplication test
        echo $'\e[1;31m'$var1 x $var2 = $youranswer$'\e[0m'
    ;;
    "/" ) let youranswer=var1/var2 # Division test
        echo $'\e[1;35m'$var1 / $var2 = $youranswer$'\e[0m'
    ;;
    *) echo "Sorry, I cannot calculate those variables" # default case
    ;;
    esac
    echo "equals $youranswer"

elif test $option -eq 5; then
# Option 5 - Folder maker
# Get user input to find how many folders need to be made
    read -p 'What number should we start making folders from?: ' start
    read -p 'What number should we stop making folders at?: ' end
    # For every number between the first argument and the last
    for ((i = $start; i <= $end; i++))
    do
        # Create a new folder for that number
        echo "Creating directory number $i"
        mkdir "week$i"
    done
elif test $option -eq 6; then
# Option 6 - Check file names
# Get the name of the file that contains the filenames to check
    read -p 'What is the name of the file (eg. filenames.txt)?: ' FILE
    while read LINE; do
        echo "name is: $LINE"
        if [ -f "$LINE" ]; then
            echo "$LINE: That file exists"
        elif [ -e "$LINE" ]; then
            echo "$LINE: That is a directory"
        else 
            echo "I don't know what that is!"
        fi
    done < $FILE
elif test $option -eq 7; then
# Option 7 - Download a file
    while [ "$website" != "exit" ] 
    do
        read -p 'Type a website URL to download or type exit to quit: ' website #get user input for where to download from
        if [ "$website" = "exit" ]
        then
            echo "See you later alligator."
            exit 0
        else
        # Get user input for the save location
            read -p 'Type a download location: ' location
        fi
        echo "$website will be saved in $location :) "
        wget --directory-prefix="$location" "$website"
        echo "$website has been saved in $location :)"
    done
elif test $option -eq 8; then
    exit 0
else
    echo "not valid input"
fi