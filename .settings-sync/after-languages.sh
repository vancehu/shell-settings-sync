## git add a collaborator's remote
grac () {
    if [ -z "$1" ]; then echo "Please specify collabrator's name"; return 1; fi
	origin_url=$(git remote get-url origin)
    git remote remove $1 || true
	new_url=$(echo $origin_url | sed "s/:.*\//:$1\//g")
	git remote add "$1" $new_url
	if git fetch "$1"
	then
		echo "Successfully added $1"
	else
		git remote remove "$1"
		echo "Removed $1"
	fi
}
## list stashes on pwd change
function chpwd() {
  if [ -d ".git" ]; then echo `git stash list`; fi
}
chpwd