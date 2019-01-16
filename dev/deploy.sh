#!/bin/bash
# deploy.sh v1 created 15 January 2019 
# By Joel Savitz <jsavitz@redhat.com>
# 
# Purpose: Deploy scripts that are ready by copying them to dir accessible by PATH

# pseudo:
#   for each file in a list of files, copy

# or: given a filename, copy it from dev to prod in repo root

usage() {
	echo "Usage: $0 <script_filename>"
	exit 1
}

if [ -n "$1" ]
then
#TODO	

