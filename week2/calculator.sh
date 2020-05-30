#!/bin/bash
youranswer=0
echo $youranswer
read -p 'Enter first number: ' var1
read -p 'Enter expression (+, -, *, /): ' expression
read -p 'Enter second number: ' var2

case $expression in
"+" ) let youranswer=var1+var2
    echo $'\e[1;34m'$var1 + $var2 = $youranswer$'\e[0m'
# code if match
;;
"-" ) let youranswer=var1-var2
    echo $'\e[1;32m'$var1 - $var2 = $youranswer$'\e[0m'
# code if match
;;
"*" ) let youranswer=var1*var2
    echo $'\e[1;31m'$var1 x $var2 = $youranswer$'\e[0m'
# code if match
;;
"/" ) let youranswer=var1/var2
    echo $'\e[1;35m'$var1 / $var2 = $youranswer$'\e[0m'
# code if match
;;
*) echo "Sorry, I cannot calculate those variables" # default case
# code if default case
;;
esac
echo "equals $youranswer"