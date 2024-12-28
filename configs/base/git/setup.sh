#!/bin/sh
_git_to="$HOME/.gitconfig"
cp -f "$(pwd)/_gitconfig" $_git_to
echo "Created $_git_to"

# copy on Windows
_git_userprofile=$(env | grep USERPROFILE | cut -d '=' -f 2)
if [ ! $_git_userprofile = "" ]; then
  _git_to="$_git_userprofile\\.gitconfig"
  cp -f "$(pwd)\\_gitconfig" $_git_to
  echo "Created $_git_to"
fi

unset _git_to
unset _git_userprofile
