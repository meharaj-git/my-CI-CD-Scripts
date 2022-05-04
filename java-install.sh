#!/bin/bash
LOG_FILE=/tmp/java-status.txt
touch $LOG_FILE
sudo chmod 777 $LOG_FILE
echo -e "\n***********************" 2>&1 | tee -a $LOG_FILE
echo "Date:                   " $(date) 2>&1 | tee -a $LOG_FILE
echo -e "START Java Installation \n" 2>&1 | tee -a $LOG_FILE
sudo apt-get update -y &&  sudo apt-get upgrade -y  2>&1 | tee -a $LOG_FILE
sudo apt-get install default-jre -y  2>&1 | tee -a $LOG_FILE
sudo java -version  2>&1 | tee -a $LOG_FILE
echo -e "\nEND Java Installation " 2>&1 | tee -a $LOG_FILE
echo -e "***********************\n" 2>&1 | tee -a $LOG_FILE


#Java Uninstall steps
#dpkg -l | grep openjdk
#sudo apt purge openjdk-11-* -y
#or
#sudo apt remove --autoremove openjdk-11-* -y


#dpkg -l | grep oracle-java 
#sudo apt purge oracle-java16-* -y
#or
#sudo apt remove --autoremove oracle-java16-* -y
