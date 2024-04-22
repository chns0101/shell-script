#!/bin/bash

echo "addition of 2 numbers"

#Arithemetic operaters +,-,*,%

NO1=$1
NO2=$2

SUM=$(($NO1+$NO2))

if [ $NO1 > 0 && $NO2 > 0]{
echo "total of $NO1 and $NO2 is :$SUM"
}
else
    echo "please enter number"
