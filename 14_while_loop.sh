#!/bin/bash

count=1

while [ $count -lt 5 ]
do
	echo "================================"
	echo "value of count is $count"
	count=$(( $count + 1 ))
	sleep 1
	echo "================================"
done

echo "out of loop"
