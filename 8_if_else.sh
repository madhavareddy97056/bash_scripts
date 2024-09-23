#!/bin/bash

read -p "Enter a number: " NUM
echo
if [ $NUM -gt 100 ]
then
	echo "Entered IF block"
	sleep 1
	echo "Your number $NUM is greater than 100"
else
	echo "Entered ELSE block"
	sleep 1
	echo "Your number $NUM is less than 100"
fi
