#!/bin/bash
port_number1=8095
port_number2=8080
x=`date`
netstat -ntlpu | grep -w ":$port_number1"
if [ $? -ne 0 ]
then
        echo "Tomcat is not working as of $x" | mail -s "Tomcat stop alert" kittu16000@gmail.com
fi
netstat -ntlpu | grep -w ":$port_number2"
if [ $? -ne 0 ]
then
        echo "Jenkins is not working as of $x" | mail -s "Jenkins stop alert" kittu16000@gmail.com
fi
