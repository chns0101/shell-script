#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then    
    echo -e "$G source directory exists $N"
else
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
fi

# touch sample -- it creates file with current timestamp

# touch -d 20240401 sample  -- it creates file with mentioned timestamp

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

echo "Files to delete :$FILES"

# IFS  -- Internal Field Separator
# “-r” option is used to prevent backslashes from being treated as escape characters.

while IFS= read -r line
do
    echo "Deleting file : $line"
    rm-rf $line
done <<< $FILES