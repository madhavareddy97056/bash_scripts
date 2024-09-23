#!/bin/bash

echo "Hi $USER user, welcome to $HOSTNAME"
echo "==========================================="
echo

FREE_RAM=`free -m | grep -i mem | awk '{print $4}'`
LOAD=`uptime | awk '{print $9}'`
AVILROOTDISK=`df -h | grep -i /dev/xvda1 | grep -v /dev/xvda128 | awk '{print $4}'`
UP_TIME=`uptime -p`

echo "##############################################"
echo "Available RAM size is $FREE_RAM mb"
echo "##############################################"
echo "Load on the server $LOAD"
echo "##############################################"
echo "Available disk space in root drive $AVILROOTDISK"
echo "##############################################"
echo "Uptime of the server is $UP_TIME"
echo "##############################################"
