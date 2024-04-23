#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m]"
G="\e[32m]"
N="\e[0m]"
Y="\e[33m]"

VALIDAE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.... $R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

#echo "All packages $@"

for i in $@
do
    echo "package to install :$i"
    dnf list installed $i &>> $LOGFILE
    if [ $? -eq 0 ]
    then    
        echo -e "$i already installed...$Y SKIPPING $N"
    else 
        echo "$i not installed..Need to install"
        dnf install $i -y &>> $LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done



