#!/bin/bash
# sysinfo.sh v1 created 16 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Display some information about the system

E_INCORRECT_USAGE=1
VERSION=1

usage() {
	echo "Usage: `basename $0` "
	exit E_INCORRECT_USAGE
}

hello_there() {
  printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

display_info() {
  printf "===========[when]============\n"
  printf "%s\n" "$(date "+%F %T")\n"
  printf "==========[users]============\n"
  who
  printf "=======[forhowlong]==========\n"
  uptime
  printf "===========[end]=============\n"
}

# Main entry point
hello_there
display_info

exit
