#!/bin/bash
# cornercounter.sh v1 created 16 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Count in the corner

i=$((0))

printf "$i"
sleep 1
printf "%d" "$((i+1))"
sleep 1

exit
