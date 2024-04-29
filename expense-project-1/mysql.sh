#!/bin/bash

source ./common.sh

check_root_user

echo "please enter DB password"
read -s mysql_root_password

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing mysql-server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling mysql-server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting mysql-server"

#mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
#VALIDATE $? "setting up root password"

#below code will be useful for idempotent nature

mysql -h db.daws78.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password}
    VALIDATE $? "MySQL root password setup"
else
    echo -e "MySQL Root password is already setup... $Y SKIPPING $N"
fi




#create instance
#login into mysql instance
#git clone code
#sudo sh mysql.sh
#netstat -lntp  port 3306
