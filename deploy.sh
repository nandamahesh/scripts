#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ]; then
for i in `cat IPs.txt`
do
echo "Deploying war file into $i QA Server..."
sleep 6
pwd
ssh pass -p "weblogic@123" scp target/*.war mahesh@$i:/home/mahesh/apache-tomcat-8.5.32/webapps
echo "Starting tomcat server in $i QA Server.."
sshpass -p "weblogic@123" ssh mahesh@$i "JAVA_HOME=/home/mahesh/jdk1.8.0_171" "/home/mahesh/apache-tomcat-8.5.32/bin/startup.sh"
done
echo "Deployment is successfull"
fi
