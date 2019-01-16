#!/bin/bash
# cornercounter.sh v1 created 16 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Counts n seconds in the corner (defaults to 10)
# TODO: add some options

i=$((0))

printf "$i"
sleep 1
printf "%d" "$((i+1))"
sleep 1

exit
