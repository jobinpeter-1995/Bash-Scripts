####################################
#Author: Jobin Peter################
#Script: Service Monitoring script##
#Date: October,2018 ################
####################################

#ReadMe
#!/usr/bin/env bash
<<comment
This script checks for the service status installed on Linux servers and sends and email if the service is down. 
comment

clear

myservices=(docker httpd)  # Modify the list of services 
read -p "Enter the Email Address for recieving the Notifications: " EmailID
for eachService in ${myservices[@]}
do
	systemctl status $eachService 1>/dev/null 2>/dev/null
	if [[ $? -ne 0 ]]
	then 
		echo "the service $eachService is not running"
		echo "The service $eachService is not runnning on $(hostname -s)" | /usr/bin/mail -s "Status of $eachService" "$EmailID"
	
	else

		echo "The service $eachService is running" 
	fi
done
