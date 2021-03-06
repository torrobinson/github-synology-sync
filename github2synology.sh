#!/bin/sh
# token from https://github.com/settings/tokens
OAUTH_TOKEN="[YOUR TOKEN HERE]"
BACKUP_PATH="/volume1/sourcecode/GitHub" # Feel free to change this to anything. `volume1` is the root volume.
API_URL="https://api.github.com/user/repos?type=owner&per_page=100&page=1"

echo "Fetching from ${API_URL}"
REPOS=`curl -H "Authorization: token ${OAUTH_TOKEN}" -s "${API_URL}" | jq -r 'values[] | "\(.full_name)"'`
for REPO in $REPOS
do
	REPONAME=`echo ${REPO} | cut -d ',' -f1`		
	RESULTINGFILE="${BACKUP_PATH}/${REPONAME}"
	DIR=$(dirname ${RESULTINGFILE})
	mkdir "${DIR}" -p
	FILENAME="$RESULTINGFILE.zip"
	curl -vLJ https://$OAUTH_TOKEN:@api.github.com/repos/$REPONAME/zipball/master > "$FILENAME"
done
