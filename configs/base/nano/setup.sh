#!/bin/sh
_nano_to="$HOME/.nanorc"
cp -f "$(pwd)/_nanorc" $_nano_to
echo "Created $_nano_to"

# copy on msys2
_nano_userprofile=$(env | grep USERPROFILE | cut -d '=' -f 2)
if [ ! $_nano_userprofile = "" ]; then
  _nano_to="$_nano_userprofile\\.nanorc"
  cp -f "$(pwd)\\_nanorc" $_nano_to
  echo "Created $_nano_to"
fi

unset _nano_to
unset _nano_userprofile
