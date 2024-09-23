#!/bin/bash

# Declaring variables
PACKAGES="httpd unzip wget"
TEMP_DIR="/tmp/webfiles"
#SRV="httpd"
#URL="https://www.tooplate.com/zip-templates/2130_waso_strategy.zip"
#ART_FILE="2130_waso_strategy"

echo "#############################################"
echo "installing httpd and depedencies"
echo "#############################################"
sudo yum install $PACKAGES -y > /dev/null
echo

echo "#############################################"
echo "starting and enables httpd service"
echo "#############################################"
sudo systemctl start $3
sudo systemctl enable $3
echo

echo "#############################################"
echo "creating directory and downloading web files"
echo "#############################################"
sudo mkdir -p $TEMP_DIR
cd $TEMP_DIR
wget $1 &> /dev/null
sudo unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html
echo 

echo "#############################################"
echo "restarting httpd service"
echo "#############################################"
sudo systemctl restart $3
echo

echo "#############################################"
echo "removing webfiles"
echo "#############################################"
sudo rm -rf $TEMP_DIR

echo "#############################################"
echo "status of httpd"
echo "#############################################"
sudo systemctl is-active $3
echo
