#!/bin/bash

# Declaring variables
#PACKAGES="httpd unzip wget"
TEMP_DIR="/tmp/webfiles"
#SRV="httpd"
URL="https://www.tooplate.com/zip-templates/2130_waso_strategy.zip"
ART_FILE="2130_waso_strategy"

# Verfying OS
echo "Verifying Operating system"
yum --help &> /dev/null

if [ $? -eq 0 ]
then
	echo "setup running on CentOS"
	PACKAGES="httpd unzip wget"
	SRV="httpd"

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

else
	echo "setup running on CentOS"
	PACKAGES="apache2 unzip wget"
        SRV="apache2"

        echo "#############################################"
        echo "installing httpd and depedencies"
        echo "#############################################"
        sudo apt install $PACKAGES -y > /dev/null
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
        echo "restarting apache2 service"
        echo "#############################################"
        sudo systemctl restart $SRV
        echo

        echo "#############################################"
        echo "removing webfiles"
        echo "#############################################"
        sudo rm -rf $TEMP_DIR

        echo "#############################################"
        echo "status of apache2 service"
        echo "#############################################"
        sudo systemctl is-active $SRV
        echo
fi
