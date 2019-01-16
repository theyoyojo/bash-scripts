#!/bin/bash
# install.sh v1 created 15 January 2019 
# By Joel Savitz <jsavitz@redhat.com>

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

SCRIPT_DIR_APPEND="export SCRIPT_DIR=$DIR/prod"
PATH_APPEND="export PATH=$PATH:\$SCRIPT_DIR"


if grep -q $DIR <<< ":$PATH"
then
	printf "already "
else
	printf "Installing...\n"

	# Add dirs to PATH
	printf "\n# Scripts by jsavitz\n" >> ~/.bashrc
	printf "$SCRIPT_DIR_APPEND\n" >> ~/.bashrc
	printf "$PATH_APPEND\n" >> ~/.bashrc

	# Tell user about it
	printf "Directory $DIR added to PATH\n\tRestart bash for changes to take effect.\n"
fi

printf "installed to $DIR\n"
exit
