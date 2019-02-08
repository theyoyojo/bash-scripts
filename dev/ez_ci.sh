#!/bin/bash
# ez_ci.sh v1 created 31 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: ez continuous integration sort of

SUCCESS=0
FAILURE=1
INTERVAL=5

BIN=$1

if [ -z $1 ]
then
	echo "Arg1 must be binary name"
	exit $FAILURE
fi

for((;;))
do
	make clean
	make
	valgrind $BIN
	sleep $INTERVAL
done

exit $SUCCESS
