#!/usr/bin/bash

case "$(uname -s)" in
  Darwin) userdir="$HOME/Library/Application Support/Code/User" ;;
  # Linux)  jetbrains_dir="$HOME/.config/..." ;;
  *)      echo "only osx is supported"; exit ;;
esac

cp -rf "${userdir}/snippets/" "./user-settings/snippets/"
cp -f "${userdir}/settings.json" "./user-settings/"
cp -f "${userdir}/keybindings.json" "./user-settings/"
cp -f "${userdir}/tasks.json" "./user-settings/"
code --list-extensions > "./user-settings/extensions.txt"
