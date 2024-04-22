#!/bin/bash

echo "addition of 2 numbers"

#Arithemetic operaters +,-,*,%

NO1=$1
NO2=$2
NO3=$3

#gt greater than ,lt lesser than,eq equal, nq not equal to
if [ $NO3 -gt 10 ]
then
    echo "given number $NO3 is greater than 10"
else
    echo "given number $NO3 is lesser than 10"
fi

SUM=$(($NO1+$NO2))

if [[ $NO1 -gt 0 & $NO2 -gt 0 ]]
then
    echo "total of $NO1 and $NO2 is :$SUM"
else
    echo "please enter number"
fi


