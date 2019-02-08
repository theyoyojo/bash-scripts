#!/bin/bash
# deadloop.sh v1 created 23 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: CONSUME THE CPU

# Do nothing forever in the background
for((;;));do :;done&

exit # This line is never executed
