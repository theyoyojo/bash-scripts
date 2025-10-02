#!/bin/bash

die() { echo "$1" ; exit 1 ; } ;

JIRA=${1}
[ ! -z $JIRA ] || die "no jira"

for commit in $(cat revs); do
	git cherry-pick -n $commit
	upstream_commit=$(git show -s $commit | awk '/cherry picked/ { print $5 }' | sed 's,),,')
	git commit -s -F- <<EOF
$(git show -s --pretty=format:'%s' $upstream_commit)

JIRA: https://issues.redhat.com/browse/$JIRA

$(git show -s $upstream_commit)"
EOF

done
