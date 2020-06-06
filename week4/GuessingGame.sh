#!/bin/bash

# This function prints a given error
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

# This function will get a value between the 2nd and 3rd arguments
getNumber()
{
    read -p "$1:"
    while (( $REPLY < $2 || $REPLY> $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1:"
    done
}

checkNumber()
{
    $1
    while (( $REPLY != 42 )); do
        if [ $REPLY -lt 42 ]; then
        echo "Too low"
        elif [ $REPLY -gt 42 ]; then
        echo "Too high"
        else
        printError "Invalid input"
        fi
        read -p "Please type a number between 1 and 100:$1"
    done
    echo "Correct!"
}

echo "this is the start of the script"
getNumber "please guess a number between 1 and 100" 1 100
checkNumber
echo "Thank you!"