#!/bin/sh
# adapted by npache from Rafael's toolkit to work on a `git cherry-pick`-based workflow
# received by jsavitz from npache on 9 March 2022

COMMIT=${1}
PREFIX=${2}
COVER=${3}
BZ=${4}
function strip_diffstat()
{
        awk '
        /#? .* \| / \
                { eat = eat $0 "\n"
                  next }
        /^#? .* files? changed(, .* insertions?\(\+\))?(, .* deletions?\(-\))?/ \
                { eat = ""
                  next }
                { print eat $0
                  eat = "" }
        '
}

function original_commit()
{
 awk -F' ' '{print $5}' | sed 's/[()]//g'
}
function conflicts()
{
 awk '/Conflicts:/,0 { print substr($0,6) }'
}

function die()
{
        echo $1
        exit 1
}

if [ -e ~/.gitconfig ]; then
        NAME=$(awk -F "= " '/name =/ {print $2}' ~/.gitconfig)
        ADDR=$(awk -F "= " '/email =/ {print $2}' ~/.gitconfig)
else
        die "ERROR: cannot open ~/.gitconfig file"
fi

CHERRY=$(git --no-pager show -s ${COMMIT} |grep 'cherry picked')
ORIG_COMMIT=$(echo $CHERRY | original_commit)
LOCAL_COMMIT=$(git rev-parse ${COMMIT})
MSG_ID=$(date +%s)

echo "From ${LOCAL_COMMIT} Tue Sep 17 00:00:00 1991"
echo "Message-Id: <${LOCAL_COMMIT}.${MSG_ID}.git@redhat.com>"
echo "In-Reply-To: ${COVER}"
echo "References: ${COVER}"
echo "From: ${NAME} <${ADDR}>"
echo "Date: $(date -R)"
echo "Subject: ${PREFIX} $(git log --oneline -1 --pretty=format:'%s' ${COMMIT})"
echo " "
echo "$(git --no-pager show -s ${ORIG_COMMIT})"
echo " "
echo "$(git --no-pager show -s ${COMMIT} | conflicts)"
echo "Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=${BZ}"
echo "Signed-off-by: ${NAME} <${ADDR}>"
echo "---"
echo "$(git --no-pager diff ${COMMIT}^ ${COMMIT} --stat)"
echo " "
echo "$(git --no-pager diff ${COMMIT}^ ${COMMIT})"
echo "--"
echo "$(git --version | awk -F' ' '{print $3}')"
