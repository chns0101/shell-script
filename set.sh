#!/bin/bash

set -e

failure(){
    echo "error at $1 $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

i=1

if [ $j -ne 0 ]
then
    echo "j is not equal to 0"
else
    echo " j is equal to 0"
fi

dnf install gittt -y

echo "script executed successfully"
