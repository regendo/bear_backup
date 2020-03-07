#!/bin/bash
git init -q
git add -A
git status | grep "nothing to commit" > /dev/null
if [[ $? -ne 0 ]]
then
	# changes exit: grep failed to match the string
	git commit -q -m "automated backup"
	git remote | wc -l | grep "0" > /dev/null
	if [[ $? -ne 0 ]]
	then
		# has remote
		git push
	fi
fi
