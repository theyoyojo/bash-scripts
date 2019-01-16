#!/bin/bash
# new.sh v1 created 15 January 2019
# By Joel Savitz <jsavitz@redhat.com>
# Creates a new shell script with a few lines of starter code and executable permisisons set

VERSION=1.1

usage() {
	echo "Usage: `basename $0` <new_script_filename>"
	exit 1
}
# add option to open new file in vim?

hello_there() {
  printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

# Add option for custom date specifier?
generate_script() {

  # Create the skeleton of the script: The file itself, executable permissions,
  #+and the first line of every bash script, as seen below
	touch $1
	chmod a+x $1
	printf "#!/bin/bash\n" >> $1

  # A note about the temporal aspect of creation
	local TODAY=$(date '+%d %B %Y')
	printf "# $1 v1 created $TODAY \n" >> $1

  # Sign the header with identity fetched from git config
  # I assume the user has this configured if they cloned this repo
	local GIT_NAME="$(git config --get user.name)"
	local GIT_EMAIL="$(git config --get user.email)"
	printf "# By %s %s <%s>\n" $GIT_NAME $GIT_EMAIL >> $1

  # Add a line for the author of the new script to enter their intended purpose
  printf "#\n# Purpose: \n" >> $1

  # Why not add the concluding exit while we are here?
  printf "\n\nexit" >> $1
}

# Main entry point for script
hello_there
if [ -n "$1" ]
then
	# If the file does not exist, generate it
	if [ ! -f $1 ]
	then
		generate_script $1
    printf "Created a blank bash script named \"%s\"\n" $1
	# Otherwise, don't do anything
	else
		printf "File \"$1\" exists. Will not overwrite.\n"
	fi
else
	usage
fi

exit
