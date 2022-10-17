# Author: Nico Pache <npache@redhat.com>
# Some edits by: Joel Savitz <jsavitz@redhat.com>
#
# Purpose: Converts from a git cherry pick -x format to the expected RHEL format

# Backwards compatiable with the email workflow
# ie gcpx XXXXXXXX; gcpx YYYYYYYY; gcpx ZZZZZZZZ;
# rhel-format 3 999999 "RHELX.Y"
# rhel-format <# of patches> <BZ#> <email subject prefix>

usage() {
	echo "usage: $0 <# of patches> <BZ#> <Email subject prefix>"
	echo "example: $0 3 9999999 \"RHEL22.2\""
}

rhel-format() {
        BZ=$2
        PRE=$3
        NUM=$1
        OUTPUT=~/rhnotes/bz${BZ}/rhel-patches/

        mkdir -p ${OUTPUT}
        git format-patch -n${1} --cover-letter --subject-prefix="$PRE bz$BZ PATCH" --output-directory ${OUTPUT}
        find ${OUTPUT} ! -name '0000-cover-letter.patch' -type f -exec rm -f {} +
        COVER=$(grep 'Message-Id' ${OUTPUT}/0000-cover-letter.patch | awk -F' ' '{print $2}')
        for i in $( eval echo {$NUM..1} );
	do
		output_name=$(printf "%s-%04d" bz$BZ $i)
		# requires format-backport-patches.sh installed (in bash-scripts)
		format-backport-patches.sh "HEAD~$(($NUM - $i))" "[$PRE bz${BZ} PATCH $i/$NUM]" "${COVER}" "${BZ}" > "${OUTPUT}${output_name}.patch"; 
        done
}

if [ -z ${1} ]; then
	echo "No # of patches supplied! This is mandatory."
	usage
	exit 1
fi

if [ -z ${2} ]; then
	echo "No bugzilla number! This is mandatory."
	usage
	exit 1
fi

if [ -z ${3} ]; then
	usage
	echo "No email prefix (but who cares!)"
fi


rhel-format ${1} ${2} ${3}

exit 0
