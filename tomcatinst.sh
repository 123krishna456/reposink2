#!/bin/bash
# Go to root/opt
cd /opt
# Remove existing version of apache tomcat
sudo rm -rf apache*
# Getting latest version link of tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz
# unzipping apache tomcat 
sudo tar -xzvf /opt/apache-tomcat-10.0.27.tar.gz
# starting up the tomcat process
sudo sh /opt/apache-tomcat-10.0.27/bin/startup.sh


