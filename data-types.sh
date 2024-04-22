#!/bin/bash

MOVIES=("RRR" "DjTillu" "pushpa")

#list always start with 0. but size of above array is 3
#index are 0,1,2

#index always starts with 0

echo "first movie is: ${MOVIES[0]}"

#@ is the symbol to print everything

echo "movies list : ${MOVIES[@]}"


echo "addition of 2 numbers"

#Arithemetic operaters +,-,*,%

NO1=$1
NO2=$2

SUM=$(($NO1+$NO2))

if [ $NO1 > 0 && $NO2 > 0]
    echo "total of $NO1 and $NO2 is :$SUM"
else
    echo "please enter number"

