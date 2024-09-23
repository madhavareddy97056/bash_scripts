#!/bin/bash

NO_OF_ADAPTERS=$(ifconfig | grep -c mtu)
echo

if [ $NO_OF_ADAPTERS -eq 1 ]
then
	echo "Your machine has $NO_OF_ADAPTERS number of adapters"
elif [ $NO_OF_ADAPTERS -gt 1 ]
then
	echo "Your machine has $NO_OF_ADAPTERS number of adapters"
else
	echo "Your machine has $NO_OF_ADAPTERS number of adapters"
fi

