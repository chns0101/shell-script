#!/bin/bash

COURSE="Devops from Current script"

echo "Before calling other script, course: $COURSE"

echo "Process ID of current script: $$"

#./other-script.sh

echo "calling other script using source command"

source ./other-script.sh

echo "After calling other script, course: $COURSE"




