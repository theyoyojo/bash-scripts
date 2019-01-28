#!/bin/bash
# generate_makefile.sh v1 created 27 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Generate a simple makefile as needed

VERSION=1
SUCCESS=0
E_INCORRECT_USAGE=1
E_NO_OVERWRITE=2

usage() {
	echo "Usage: `basename $0` <new_script_filename>"
	exit $E_INCORRECT_USAGE
}

hello_there() {
	printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

create_makefile() {
	if [ -f "Makefile" ]
	then
		# Don't overwrite an existing makefile
		printf "Makefile exists in working directory, will not overwrrite.\n"
		exit $E_NO_OVERWRITE
	fi

	cat > Makefile <<EOF
# Quick and dirty and relatively generic Makefile
# Generated by generate_makefile.sh
# By Joel Savitz <jsavitz@redhat.com>

CC 	= gcc
CFLAGS  = -g -Wall -Werror -std=gnu11
OBJECTS = $OBJECTS
BIN	= $BIN

all: \$(OBJECTS)
	\$(CC) \$(CFLAGS) \$(OBJECTS) -o \$(BIN)

%.o: %.c
	\$(CC) \$(CFLAGS) -c $^ -o $@

.PHONEY: clean
clean:
	rm -rf \$(BIN) \$(OBJECTS)
EOF
}

parse_options() {
	while getopts "b:o:" OPTION; do
	    case $OPTION in
	    b)
		BIN=$OPTARG
		echo "Hello"
		;;
	    o)
		OBJECTS=$OPTARG
		;;
	    *)
		usage
		;;
	    esac
	done

	echo $BIN
	echo $OBJECTS

	# Defaults, if no options supplied
	if [ -z "$BIN" ]
	then
		BIN=app
	fi
	if [ -z "$OBJECTS" ]
	then
		OBJECTS=main.o
	fi
}

hello_there
parse_options
create_makefile

exit $SUCCESS
