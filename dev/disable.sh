#!/bin/bash
# disable.sh v1 created 21 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Disable a script from being executable via PATH
# Requires: Installation

VERSION=1

SUCCESS=0
E_INCORRECT_USAGE=1
E_FILE_NOT_FOUND=2

usage() {
	echo "Usage: `basename $0` <script_name>"
	exit $E_INCORRECT_USAGE
}

hello_there() {
	printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

# Does the first argument exist?
check_args() {
	if [ -z "$1" ]
	then
		usage
	fi
}

check_if_not_exists() {

	# Check if the script does not exist
	if [ ! -f "$SCRIPT_DIR/$1" ]
	then
		printf "Script file \"$1\" does not exist. Cannot disable.\n"
		exit $E_FILE_NOT_FOUND
	fi
}

disable_script() {

	# Remove the script from the prod/ directory if it exists
	if [ -f "$SCRIPT_DIR/$1" ]
	then
		rm -rf "$SCRIPT_DIR/$1"
		echo "Script \"$1\" has been disabled"
	else
		echo "Script \"$1\" already disabled"
	fi
}

# Main entry point for script
hello_there

# Validate preconditions for main body execution

# User must supply one or more arguments
check_args  $1

# Script file must exist
check_if_not_exists $1

# Body
disable_script $1

exit $SUCCESS
