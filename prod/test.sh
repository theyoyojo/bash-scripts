#!/bin/bash
# test.sh v1 created 21 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: 

echo "RAN test.sh"

echo "preshift"

echo "\$@= $@"
echo "\$*= $*"
echo "\$#= $#"

shift 2

echo "postshift"

echo "\$@= $@"
echo "\$*= $*"
echo "\$#= $#"

exit
