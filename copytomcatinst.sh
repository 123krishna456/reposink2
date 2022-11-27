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
# changing configuration via server.xml and tomcat-users.xml
sudo sed 's/Connector port="8080"/Connector port="8095"/1' /opt/apache-tomcat-10.0.27/conf/server.xml
sudo sed '/</tomcat-users>/i <role rolename="manager-gui"/>\n <role rolename="manager-script"/>\n <role rolename="manager-jmx"/>\n <role rolename="manager-status"/>\n <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>\n <user username="deployer" password="deployer" roles="manager-script"/>\n <user username="tomcat" password="s3cret" roles="manager-gui"/>\n' /opt/apache-tomcat-10.0.27/conf/tomcat-users.xml
# Commenting on valve classname in manager and hostmanager subfolders of webapps folder
sudo sed '/<Valve /i <!--\n ' /opt/apache-tomcat-10.0.27/webapps/manager/META-INF/context.xml
sudo sed '/<Manager /i -->\n ' /opt/apache-tomcat-10.0.27/webapps/manager/META-INF/context.xml

sudo sed '/<Valve /i <!--\n ' /opt/apache-tomcat-10.0.27/webapps/host-manager/META-INF/context.xml
sudo sed '/<Manager /i -->\n ' /opt/apache-tomcat-10.0.27/webapps/host-manager/META-INF/context.xml
# Restarting tomcat after configuration
sudo su -
sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh
sleep 4
sh /opt/apache-tomcat-10.0.27/bin/startup.sh

