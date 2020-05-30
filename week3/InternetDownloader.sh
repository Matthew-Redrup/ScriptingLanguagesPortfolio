#!/bin/bash
while [ "$website" != "exit" ] 
do
    read -p 'Type a website URL to download or type exit to quit: ' website
    if [ "$website" = "exit" ]
    then
        echo "See you later alligator."
        exit 0
    else
        read -p 'Type a download location: ' location
    fi
    echo "$website will be saved in $location :) "
    wget --directory-prefix="$location" "$website"
    echo "$website has been saved in $location :)"
done