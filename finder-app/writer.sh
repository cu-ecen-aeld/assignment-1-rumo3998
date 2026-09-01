#!/bin/bash
# writer app test script
# Author: Ruben Moreno

#variables for runtime args
writefile=$1
writestr=$2

#simple conditional checks

#first check for 2 args
if [ $# -lt 2 ]
then
	echo "Incorrect number of args, retry and enter 2."
	exit 1
fi

#Next, check that the 1st arg is a file.
#checks if it is a regular file and exists.
if [ -f "$writefile" ]
then
	#concatenate writestr to the file
	echo "$writestr" > "$writefile"
else
	#Did not exist so try to make the file
	DIRPATH=$(dirname "$writefile")
	
	#try to make path if dne
	mkdir -p "$DIRPATH"


	#check if successful otherwise throw error
	if [ ! "$?" -eq 0 ]
	then
		echo "file could not be created"
		exit 1
	else
		echo "$writestr" > "$writefile"
	fi
fi
