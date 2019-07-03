## git add a collaborator's remote
grac() {
  origin_url=$(git remote get-url origin)
  new_url=$(echo $origin_url | sed "s/vancehu/$1/g")
  git remote add "$1" $new_url
  if git fetch "$1" ; then
    echo "Successfully added $1"
  else
    git remote remove "$1"
    echo "Removed $1"
  fi
}

## set title
ttitle() { echo -ne "\e]1;$@\a" }

## current folder as title
function chpwd { ttitle "$(basename "$PWD")" }
ttitle "$(basename "$PWD")"

if [[ $OSTYPE == darwin* ]];
then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
else
  # TODO: chrome
fi
