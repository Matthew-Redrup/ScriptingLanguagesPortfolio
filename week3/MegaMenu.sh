#!/bin/bash

/home/kali/ScriptingLanguagesPortfolio/week2/passwordCheck.sh
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
read -p 'enter here: ' option
echo "your option was ${option}"
if test $option -eq 1; then
	./foldermaker.sh
elif test $option -eq 2; then
	./foldercopier.sh
elif test $option -eq 3; then
	./setPassword.sh
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
