#!/bin/bash

ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
	echo "Httpd service is up and running"
	date
	echo
else
	echo "Httpd service is not running"
	sleep 2
	echo "Trying to start Httpd service"
	date
        systemctl start httpd
	if [ $? -eq 0 ]
	then
		echo "HTTPD service started successfully"
		HTTPD_SERVICE=$(systemctl is-active httpd)
		echo "Status of Httpd service $HTTPD_SERVICE"
	else
		echo "There is a problem while starting httpd service. Please contact admin to for help"
	fi
fi

echo "#################################################"

