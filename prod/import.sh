#!/bin/bash
# import.sh v1 created 08 February 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Import a library maybe? We'll see where this one goes

SUCCESS=0
E_FILE_NOT_FOUND=1
E_UNKNOWN_FAILURE=100

echo "import.sh called with args: $@"

echo "Attempting to source file $1 from $SCRIPT_DIR"

# Quietly source the file
source $SCRIPT_DIR/$1 > /dev/null 2>&1

if [[ $? -ne 0 ]]
then
	echo "import.sh failure: $1 not found."
	exit $E_FILE_NOT_FOUND
else
	echo "Import of $1 succeeded"
fi


#absolute stubbery

exit $SUCCESS
