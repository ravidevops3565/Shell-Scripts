#!/bin/bash

num1=$1
num2=$2

# how do you run a command inside shell script and get the output
#$(date)



TIMESTAMP =$(date) # it will execute the date command and will pass the value to the variable dynamically 

echo "script executed: $TIMESTAMP"

sum=$(($num1+$num2))

echo "SUM of $num1 and $num2 is $sum"