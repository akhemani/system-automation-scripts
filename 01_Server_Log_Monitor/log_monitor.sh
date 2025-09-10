#!/bin/bash

LOG_FILE=$1

# check if an argument is provided or not
if [ -z "$LOG_FILE" ]; then
	echo "Please provide the log file name to monitor"
	exit 1
fi

# check if provided argument is a directory
if [ -d "$LOG_FILE" ]; then
	echo "Please provide a valid file name only"
	exit 1
fi

# check if provided argument is already present file
if [ ! -f "$LOG_FILE" ]; then
	echo "$1 file not present. Please check"
	exit 1
fi

# function to act on getting 500
process_line () {
	echo "Got error from server"
}

# reads all previous content
cat $LOG_FILE | while read -r line; do
	if echo $line | grep -q 500; then
		process_line
	fi
done

# reads new entries
tail -F $LOG_FILE | while read -r line; do
	if echo $line | grep -q 500; then
		process_line
	fi
done

