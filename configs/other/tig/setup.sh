#!/bin/sh
_tig_to="$HOME/.tigrc"
cp -f "$(pwd)/_tigrc" $_tig_to
echo "Copied to $_tig_to"

# copy on Windows
_tig_userprofile=$(env | grep USERPROFILE | cut -d '=' -f 2)
if [ ! $_tig_userprofile = "" ]; then
  _tig_to="$_tig_userprofile\\.tigrc"
  cp -f "$(pwd)\\_tigrc" $_tig_to
  echo "Copied to $_tig_to"
fi

unset _tig_to
unset _tig_userprofile
