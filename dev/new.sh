#!/bin/bash
# new.sh v1 created 15 January 2019
# By Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Creates a new shell script with a few lines of starter code and
#+executable permisisons set
# Note: requires installation


VERSION=1.1
SUCCESS=0
E_INCORRECT_USAGE=1
E_NO_OVERWRITE=2

usage() {
	echo "Usage: `basename $0` <new_script_filename>"
	exit $E_INCORRECT_USAGE
}
# add option to open new file in vim?

hello_there() {
	printf "Hello there, user. I am  `basename $0` v%s\n" $VERSION
}

# Add option for custom date specifier?
generate_script() {

	# Create the skeleton of the script: The file itself, executable permissions,
	#+and the first line of every bash script, as seen below
	touch $ABSOLUTE_PATH
	chmod a+x $ABSOLUTE_PATH
	printf "#!/bin/bash\n" >> $ABSOLUTE_PATH

	# A note about the temporal aspect of creation
	local TODAY=$(date '+%d %B %Y')
	printf "# $1 v1 created $TODAY \n" >> $ABSOLUTE_PATH

	# Sign the header with identity fetched from git config
	# I assume the user has this configured if they cloned this repo
	local GIT_NAME="$(git config --get user.name)"
	local GIT_EMAIL="$(git config --get user.email)"
	printf "# By %s %s <%s>\n" $GIT_NAME $GIT_EMAIL >> $ABSOLUTE_PATH

	# Add a line for the author of the new script to enter their intended purpose
	printf "#\n# Purpose: \n" >> $ABSOLUTE_PATH

	# Why not add the concluding exit while we are here?
	printf "\n\nexit" >> $ABSOLUTE_PATH

	# Tell user about what has taken place
	printf "Created a blank bash script named \"%s\"\n" $1
}

# Does the first argument exist?
check_args() {
	if [ -z "$1" ]
	then
		usage
	fi
}

# If the file exists, don't overwrite
check_if_exists() {
	if [ -f $ABSOLUTE_PATH ]
	then
		printf "File \"$1\" exists. Will not overwrite.\n"
		exit $E_NO_OVERWRITE
	fi
}

# Main entry point for script
hello_there

 # Determinethe absolute file path
ABSOLUTE_PATH="$SCRIPT_DIR/../dev/$1"

# Validate preconditions for main body execution

# User must supply one or more arguments
check_args  $1

# The filename given as the first argument must not exist in $SCRIPT_DIR/../dev/
check_if_exists $1

# If the file does not exist, generate it
generate_script $1

exit $SUCCESS
