#!/bin/bash

MOVIES=("RRR" "DjTillu" "pushpa")

#list always start with 0. but size of above array is 3
#index are 0,1,2

#index always starts with 0

echo "first movie is: ${MOVIES[0]}"

#@ is the symbol to print everything

echo "movies list : ${MOVIES[@]}"