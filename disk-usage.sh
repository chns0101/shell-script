#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=75
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d '%' -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo " $FOLDER is more than $DISK_THRESHOLD, Current usage is $USAGE"
        MESSAGE+= "$FOLDER is more than $DISK_THRESHOLD, Current usage is $USAGE \n"
    fi
done <<< $DISK_USAGE

echo "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Data usage alert" info@joindevops.com


# += is for appending the content instead of overwriting
# \n is for new line
