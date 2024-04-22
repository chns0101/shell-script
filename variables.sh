#!/bin/bash

#declaring the variables
PERSON1:Ramesh
PERSON2:Suresh

#referring the variables
echo "$PERSON1 :: Hello $PERSON2 how are you"
echo "$PERSON2 :: Hi $PERSON1 ,Im fine. How are you"
echo "$PERSON1 :: Im fine too. How is your work"
echo "$PERSON2 :: not bad. I am thinking to upgrade todevops"

#arguments or parameters

P1=$1
P2=$2

echo "$P1 :: Hello $P2 how are you"
echo "$P2 :: Hi $P1 ,Im fine. How are you"
echo "$P1 :: Im fine too. How is your work"
echo "$P2 :: not bad. I am thinking to upgrade todevops"

