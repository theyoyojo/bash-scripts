#!/bin/bash
# sysinfo.sh v1 created 16 January 2019 
# By Joel Savitz <joelsavitz@gmail.com>
#
# Purpose: Display some information about the system
# TODO: Save data to file

E_INCORRECT_USAGE=1
VERSION=1.1
LOG_FILE=sysinfo."$(date +%F-%H)".log

usage() {
	echo "Usage: `basename $0` "
	exit E_INCORRECT_USAGE
}

hello_there() {
  printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

display_info() {
	printf "%s\n" $LOG_FILE
  touch $LOG_FILE
  printf "===========[when]============\n" | tee -a $LOG_FILE
  printf "%s\n" "$(date "+%F %T")" 	   | tee -a $LOG_FILE
  printf "==========[users]============\n" | tee -a $LOG_FILE
  who 					   | tee -a $LOG_FILE
  printf "=======[forhowlong]==========\n" | tee -a $LOG_FILE
  uptime 				   | tee -a $LOG_FILE
  printf "===========[end]=============\n" | tee -a $LOG_FILE
}

# Main entry point
hello_there
display_info
exit
