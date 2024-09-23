#!/bin/bash

USR="aws azure ibm hp oracle alibaba tencent"

for USRS in $USR
do
	echo "++++++++++++++++++++++++++++++++++++"
	sleep 1
	userdel -r $USRS
	echo "$USRS user deleted successfully"
	echo "++++++++++++++++++++++++++++++++++++"
	echo
done
