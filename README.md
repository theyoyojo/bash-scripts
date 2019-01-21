# bash-scripts
### Scripts by Joel Savitz

## installation:

install.sh has what you need

# usage:
* don't
* it's probably a bad idea
* this is your last warning


## About this system:

* new.sh <filename>:
	* creates a script from a simple template
	* will be located at $SCRIPT_DIR/../dev
	* fails if a file exists with that name in the above dir
* open.sh <filename>
	* looks for <filename> in $SCIRPT_DIR/../dev
	* opens that file for writing in vim (this will be configurable)
	* fails if the file does not exist
	* Option -l | --local to use execution directory // TODO
* deploy.sh <filename>
	* copies <filename> from $SCRIPT_DIR/../dev to $SCRIPT_DIR
	* appends scripts to appropriate headers // TODO
	* script is now executable via PATH
	* fails if the file does not exist
	* runs tests on script, TAP-compliant output // TODO
	* fails if tests fail and reports failures // TODO
	* fails if requirements for system to run script are not met
* delete.sh <filename>
	* deletes <filename> from $SCRIPT_DIR and $SCRIPT_DIR/../dev
	* will ask for confirmation
	* fails if the file does not exist


##### PROPOSED FEATURES FOLLOW:
* disable.sh <filename>
	* deletes <filename> from $SCRIPT_DIR
	* script is no longer executable via PATH
	* fails if the file does not exist
* import.sh <library-name>
	* source a set of files in order to access a particular API

dbprint function: will print when script is run in $/dev dir only

The other scripts are basically just toys for now

Note: Don't run a script without reading the header first!
