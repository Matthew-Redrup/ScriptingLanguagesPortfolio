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
