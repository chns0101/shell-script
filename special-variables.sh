#!/bin/bash

echo "prints all variables/arugments while passing to script : $@"

echo "Number of aruguments or variables passed : $#"

echo "Script name : $0"

echo "current working directory: $PWD"

echo "Home directory of current user: $HOME"

echo "Which user is running this script : $USER"

echo "Hostname : $HOSTNAME"

echo "process id of current shell script : $$"

sleep 60 # sleep for 1minute

#sleep 60 &  background running

echo "Process ID of last background command :$!"

#ps-ef | grep sleep

