#!/bin/bash

function hello() {
	echo "Ran hello()";
}

ssh jsavitz@localhost "function hello(){ \n echo WHATSUP\n }\n hello"
