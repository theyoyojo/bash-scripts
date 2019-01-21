#!/bin/bash
# open.sh v1 created 16 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: open a file in $SCRIPT_DIR/dev for editiing
# Note: Requires installation

# Meta Section
VERSION=1

# Exit codes
SUCCESS=0
E_INCORRECT_USAGE=1
E_FILE_NOT_FOUND=2

# Configuration
# TODO: load this from somewhere else
EDITOR=vim

usage() {
	echo "Usage: `basename $0` <filename>"
	exit $E_INCORRECT_USAGE
}

hello_there() {
	printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

check_args() {
	if [ -z "$1" ]
	then
		usage
	fi
}

check_if_exists() {
	if [ ! -f $ABSOLUTE_PATH ]
	then
		printf "Unable to open %s: No such file or directory\n" "$ABSOLUTE_PATH"
		exit $E_FILE_NOT_FOUND
	fi
}

# Main entry point for program
hello_there

ABSOLUTE_PATH="$SCRIPT_DIR/../dev/$1"
check_args $1
check_if_exists $1

# Open the file in it's directory
cd "$SCRIPT_DIR/../dev"
eval "$EDITOR $ABSOLUTE_PATH"

printf "Closing %s and exiting...\n" "$1"
exit $SUCCESS
