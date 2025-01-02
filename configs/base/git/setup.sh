#!/bin/sh

email=$(git config --global --get 'user.email')
name=$(git config --global --get 'user.name')

echo_gitconfig() {
  cat "$(pwd)/_gitconfig" \
    | sed -e "s#__EMAIL__#${email}#" \
    | sed -e "s#__NAME__#${name}#"
}

_git_to="$HOME/.gitconfig"
echo_gitconfig > $_git_to
echo "Created $_git_to"

# copy on Windows
_git_userprofile=$(env | grep USERPROFILE | cut -d '=' -f 2)
if [ ! $_git_userprofile = "" ]; then
  _git_to="$_git_userprofile\\.gitconfig"
  echo_gitconfig > $_git_to
  echo "Created $_git_to"
fi
