#!/bin/bash

# Get a list of fruit
read -p'Gimme some fruit baby!: ' -a FRUIT_LIST

# Print the list
for i in "${FRUIT_LIST[@]}"
do
    # print the fruit
    echo "FRUIT: $i"
done