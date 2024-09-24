#!/bin/bash

USER=devops

servers=`cat ./remotehosts.sh`

for system in $servers
do
	echo "++++++++++++++++++++++++++++++++++++++++"
	echo "Connecting to $system"
	echo "Copying scipts to remote machine $system"
	scp ./multi_os_websetup.sh devops@$system:/home/devops
	ssh $USER@$system sudo /home/devops/multi_os_websetup.sh
	ssh $USER@$system sudo rm -rf /home/devops/multi_os_websetup.sh
	echo "++++++++++++++++++++++++++++++++++++++++"
done

