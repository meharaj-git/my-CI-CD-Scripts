#!/bin/bash
LOG_FILE=/tmp/jenkins-install-status.txt
touch $LOG_FILE
sudo chmod 777 $LOG_FILE
echo -e "\n\n***********************" 2>&1 | tee -a $LOG_FILE
echo "Date:                   " $(date) 2>&1 | tee -a $LOG_FILE
echo -e "START Jenkins Installation \n" 2>&1 | tee -a $LOG_FILE
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -  2>&1 | tee -a $LOG_FILE
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'  2>&1 | tee -a $LOG_FILE
sudo apt-get update -y   2>&1 | tee -a $LOG_FILE
sudo apt-get install -y jenkins  2>&1 | tee -a $LOG_FILE
echo -e "\nEND Jenkins Installation " 2>&1 | tee -a $LOG_FILE
echo -e "***********************\n" 2>&1 | tee -a $LOG_FILE
sudo ufw allow 8080 2>&1 | tee -a $LOG_FILE
sudo ufw status 2>&1 | tee -a $LOG_FILE
sudo ufw enable 2>&1 | tee -a $LOG_FILE
#sleep 30

#Steps if you want to use different port
#echo -e "\nUpdate Port"  2>&1 | tee -a $LOG_FILE
#sudo sed -i 's/JENKINS_PORT=8080/JENKINS_PORT=8000/g' /usr/lib/systemd/system/jenkins.service 2>&1 | tee -a $LOG_FILE
#sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=8000/g' /etc/default/jenkins 2>&1 | tee -a $LOG_FILE

#echo -e "\n Stop Jenkins \n"  2>&1 | tee -a $LOG_FILE
#sudo systemctl daemon-reload 2>&1 | tee -a $LOG_FILE
#sudo systemctl stop jenkins 2>&1 | tee -a $LOG_FILE
#sudo systemctl start jenkins 2>&1 | tee -a $LOG_FILE
#sudo systemctl restart jenkins 2>&1 | tee -a $LOG_FILE
#echo -e "\n Jenkins started \n" 2>&1 | tee -a $LOG_FILE
#sudo systemctl status jenkins 2>&1 | tee -a $LOG_FILE

#sudo ufw allow 8000 2>&1 | tee -a $LOG_FILE
#sudo ufw status 2>&1 | tee -a $LOG_FILE
#sudo ufw enable 2>&1 | tee -a $LOG_FILE

#To get admin password
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#Jenkins Uninstall Steps:
#sudo apt-get remove jenkins -y
#or 
#sudo apt-get remove --auto-remove jenkins -y

#sudo apt-get purge jenkins -y
#or
#sudo apt-get purge --auto-remove jenkins -y
