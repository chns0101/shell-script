#!/bin/bash

source ./common.sh

check_root_user

echo "please enter DB password"
read -s mysql_root_password

echo "successfully entered root password"

echo "starting process"

dnf install mysql-server -y &>>$LOGFILE

systemctl enable mysqld &>>$LOGFILE

systemctl start mysqld &>>$LOGFILE

mysql -h 172.31.22.56 -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password}
    VALIDATE $? "MySQL root password setup"
else
    echo -e "MySQL Root password is already setup... $Y SKIPPING $N"
fi