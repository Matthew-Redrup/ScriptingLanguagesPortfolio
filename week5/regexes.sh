#!/bin/bash

# All sed statements
#grep -r sed
# All lines that start with the letter m
#grep -r "^m"
# All lines that contain three digit numbers
#grep -r '.*\d\d\d '
# All echo statements with at least three words
#grep -r -i 'echo .*\"[A-Z].* .*[A-Z] .*[A-Z]\"'
# All lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password)
grep -r -E '[A-Z].*[a-z].*[0-9].*[!@#$%^&*(),.].*[\w{8,16}]'