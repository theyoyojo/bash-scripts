#!/bin/bash
# new.sh v1 created 15 January 2019
# By Joel Savitz <jsavitz@redhat.com>
# Creates a new shell script with a few lines of starter code and executable permisisons set

usage() {
	echo "Usage: $0 <new_script_filename>"
	exit 1
}

# Add option for custom date specifier?
generate_script() {
	touch $1
	chmod a+x $1
	printf "#!/bin/bash\n" >> $1

	local TODAY=$(date '+%d %B %Y')
	printf "# $1 v1 created $TODAY \n" >> $1

	local GIT_NAME="$(git config --get user.name)"
	local GIT_EMAIL="$(git config --get user.email)"
	printf "# By %s %s <%s>\n" $GIT_NAME $GIT_EMAIL >> $1
}

if [ -n "$1" ]
then
	# If the file does not exist, generate it
	if [ ! -f $1 ]
	then
		generate_script $1
	# Otherwise, don't do anything
	else
		printf "File \"$1\" exists. Will not overwrite.\n"
	fi
else
	usage
fi

exit
