#!/bin/bash

USR="aws azure ibm hp oracle alibaba tencent"

for USRS in $USR
do
	echo "++++++++++++++++++++++++++++++++++++"
	sleep 1
	useradd $USRS
	echo "$USRS user added successfully"
	id $USRS
	echo "++++++++++++++++++++++++++++++++++++"
	echo
done

