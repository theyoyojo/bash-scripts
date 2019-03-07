#!/bin/bash
# ezr_ci.sh v1 created 07 March 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: ezr continuous integration sort of

SUCCESS=0
FAILURE=1
INTERVAL=5

MAKE_ARG=$1

if [ -z $1 ]
then
	echo "Arg1 must be make arg"
	exit $FAILURE
fi

for((;;))
do
	make "$MAKE_ARG"
done

exit $SUCCESS
