#!/bin/bash
# diffweb - Checks a website for changes
# Usage: diffweb https://domain.tld
# Author: Justin Oros
# Revised: 2020 JUNE 25

FILE1=/tmp/file1
FILE2=/tmp/file2

# check to see if any input was given
if [ -z $1 ]
then
	echo "Usage: diffweb https://domain.tld"
	exit 1
fi

# check to see if file1 exists
if test -f $FILE1
then    # if file1 exists
	# get website data
	# store to file2
	curl -s $1 > $FILE2
else    # if file1 does not exist
	# notify user this is the first run
	echo "diffweb has not run before for $1"
	# get website data
	# store to file1
	curl -s $1 > $FILE1
fi

# check to see if file2 exists
if test -f $FILE2
then
	# compare files
	if cmp -s $FILE1 $FILE2
	then
		# notify user website has not changed
		echo "$1 has not changed."
	else
		# notify user website has changed
		echo "$1 has been updated!"
  		# clone file2 to file1
		cat $FILE2 > $FILE1
	fi
fi
