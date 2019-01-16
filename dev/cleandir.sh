#!/bin/bash
# cleandir.sh v1 created 15 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Removes all other files in the directory it is run
#+except for itself and a readme.

REGEX_PRESERVE="^(README|cleandir\.sh)$"
DIR_DISPOSABLES=$(ls | egrep -v "$REGEX_PRESERVE")
printf "Preserved: \"%s\"\n" $(ls | egrep $REGEX_PRESERVE)

if [ ! -z "$DIR_DISPOSABLES" ]
then
  printf "Removing file: \"%s\"\n" $DIR_DISPOSABLES
  printf "$DIR_DISPOSABLES" | xargs rm
else
  printf "Nothing to clean...\n"
fi

exit
