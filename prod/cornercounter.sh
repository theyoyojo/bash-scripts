#!/bin/bash
# cornercounter.sh v1 created 16 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Counts n seconds in the corner (defaults to 10)
# TODO: add some options

i=$((0))

LIMIT=10 # seconds

echo -n "Counting until $LIMIT in this box: [$i]"

while [[ $i -lt $LIMIT ]]; do
printf "%d" $i
i="$((i+1))"
sleep 1
done

echo

exit
