#!/bin/bash

ROOT_UID=0

if [ "$UID" -ne "$ROOT_UID" ]
then
	echo 'u r not root'
	exit 88
fi


echo 'u r root'
exit
