#!/bin/bash

./passwordCheck.sh
status=$?
if test $status -eq 0 ;then
	echo "1. Create a folder"
	echo "2. Copy a folder"
	echo "3. Set a password"
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
else
	echo "not valid input"
fi
