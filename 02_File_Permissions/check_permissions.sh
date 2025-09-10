#!/bin/bash

FILE_NAME=$1
PERMISSIONS=$2

# check if both file name and permissions are provided or not
if [[ -z $FILE_NAME && -z $PERMISSIONS ]]; then
	echo "Please provide both file name and it's permissions"
	exit 3
fi

# check if provided name is of file only
if [ ! -f $FILE_NAME ]; then
	echo "Please provide valid file name only"
	exit 2
fi

# check if valid permissions are provided or not
if ! [[ "$PERMISSIONS" =~ ^[0-7]{3}$ ]]; then
    echo "Provide valid permissions like 644 or 111"
    exit 4
fi

# check if permissions are matching or not
if [ "$(stat -c %a $FILE_NAME)" -ne $PERMISSIONS ]; then
	echo "Permissions do not match"
	exit 1
else
	echo "Permissions matched"
fi

# check if file owned by current user or not (ls -ld file_name | awk '{print $3}')
if [[ "$(whoami)" != "$(stat -c %U $FILE_NAME)" ]]; then
	echo "Owner is different for $FILE_NAME"
	exit 1
else
	echo "Owner is same"
fi

# check if file is world-writable ("$(stat -c %A $FILE_NAME | cut -c9)" == "w")
ACTUAL_PERMS=$(stat -c %a "$FILE_NAME")
LAST_DIGIT="${ACTUAL_PERMS: -1}"

if [[ "$LAST_DIGIT" == "6" || "$LAST_DIGIT" == "7" ]]; then
    echo "⚠️ $FILE_NAME is world-writable"
    exit 1
fi



