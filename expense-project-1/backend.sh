#!/bin/bash

echo "please enter DB password"
read -s mysql_root_password

echo "successfully entered root password"

echo "starting process"

dnf module disable nodejs -y &>>$LOGFILE
VALIDATE $? "Disabling default nodejs"

dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "enabling nodejs:20 version"

dnf install nodejs -y &>>$LOGFILE
VALIDATE $? "Installing nodejs"

#useradd expense
#VALIDATE $? "creating expense user"

#above one will gets fail when we try to run 2nd time
#not idempotent

id expense &>>$LOGFILE
if [ $? -ne 0 ]
then
    useradd expense &>>$LOGFILE
    VALIDATE $? "Creating expense user"
else
    echo -e "expense user already created .... $Y SKIPPING $N"
fi

#mkdir /app
#VALIDATE $? "Creating app directory"

#again here also it will throw file exists error when we try to run for 2nd time

mkdir -p /app  &>>$LOGFILE #it will create if not present
VALIDATE $? "Creating app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
VALIDATE $? "Downloading backend code"

cd /app
#unzip /tmp/backend.zip &>>$LOGFILE    asking for yes or no to overwrite the file for 2nd time run
#so remove old files and replace with new one
rm -r /app/*  #removing all files in app directory
unzip /tmp/backend.zip &>>$LOGFILE
VALIDATE $? "Extracted backend code"

npm install &>>$LOGFILE
VALIDATE $? "Installing nodejs dependencies"

#script can not create file using vim its visual so we keep in once place

#absolute path of backend service is /home/ec2-user/backend.service

cp /home/ec2-user/shell-script/expense-project-1/backend.service /etc/systemd/system/backend.service &>>$LOGFILE

VALIDATE $? "Copied backend service"

systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "Daemon reload"

systemctl start backend &>>$LOGFILE
VALIDATE $? "Starting backend"

systemctl enable backend &>>$LOGFILE
VALIDATE $? "Enabling backend"

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql client"


mysql -h 172.31.22.56 -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>$LOGFILE
VALIDATE $? "Schema loading"

systemctl restart backend &>>$LOGFILE
VALIDATE $? "Restarting backend"


#create backend instance
#update route 53 record with new IP address
#run the script
#netstat -lntp  -- port 8080
#systemctl status backend


#check are you able to connect to mysql db
#telnet db.daws78s.online 3306

