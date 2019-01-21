#!/bin/bash
# delete.sh v1 created 21 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Deletes scripts and associated files

SUCCESS=0
E_INCORRECT_USAGE=1
E_FILE_NOT_FOUND=2

usage() {
	echo "Usage: `basename $0` <filename>"
	exit $E_INCORRECT_USAGE
}

hello_there() {
	printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

get_confirmation() {
	printf "$1"
	read -p "Are you sure? [Yy/cancel] " -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "Delete operation cancelled"
		exit $SUCCESS
	fi

}

# Does the first argument exist?
check_args() {
	if [ -z "$1" ]
	then
		usage
	fi
}

check_if_not_exists() {
	if [ ! -f $ABSOLUTE_PATH ]
	then
		printf "Script file \"$1\" does not exist. Cannot delete.\n"
		exit $E_FILE_NOT_FOUND
	fi
}

delete_script() {
	rm -rf "$SCRIPT_DIR/../dev/$1"

	# Remove the script from the prod/ directory if it has been deployed
	if [ -f "$SCRIPT_DIR/$1" ]
	then
		rm -rf "$SCRIPT_DIR/$1"
	fi

	echo "Script $1 deleted successfully"
}

# Main entry point for script
hello_there

# Determine the absolute file path
ABSOLUTE_PATH="$SCRIPT_DIR/../dev/$1"

# Validate preconditions for main body execution

# User must supply one or more arguments
check_args  $1

# Script file must exist
check_if_not_exists $1

# Quit if user does not want to continue
get_confirmation "You have commanded me to delete $1\n"

# Delete the script and associated files
delete_script $1

exit $SUCCESS
