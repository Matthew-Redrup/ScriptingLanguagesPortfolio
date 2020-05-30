#!/bin/bash
FILE=$1
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