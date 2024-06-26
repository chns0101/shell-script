#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2....FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then    
    echo "please run this with root access"
    exit 1 #manually exit if error comes
else
    echo "you are super user"
fi

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing git"