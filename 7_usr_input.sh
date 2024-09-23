#!/bin/bash

# Taking input from user
read -p "Enter package names which need to be installed: " PACKAGES
read -p "Enter Url to download the webfiles: " URL
read -p "Enter Artifact name: " ART_FILE
read -p "Enter service name to start, enabke and restart service: " SRV
read -p "Enter teamp directory location to download the webfiles: " TEMP_DIR

# Declaring variables
#PACKAGES="httpd unzip wget"
#TEMP_DIR="/tmp/webfiles"
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
sudo systemctl start $SRV
sudo systemctl enable $SRV
echo

echo "#############################################"
echo "creating directory and downloading web files"
echo "#############################################"
sudo mkdir -p $TEMP_DIR
cd $TEMP_DIR
wget $URL &> /dev/null
sudo unzip $ART_FILE.zip > /dev/null
sudo cp -r $ART_FILE/* /var/www/html
echo 

echo "#############################################"
echo "restarting httpd service"
echo "#############################################"
sudo systemctl restart $SRV
echo

echo "#############################################"
echo "removing webfiles"
echo "#############################################"
sudo rm -rf $TEMP_DIR

echo "#############################################"
echo "status of httpd"
echo "#############################################"
sudo systemctl is-active $SRV
echo
