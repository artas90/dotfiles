#!/usr/bin/bash

case "$(uname -s)" in
  Darwin) settings_dir="$HOME/Library/Application Support/Cursor/User" ;;
  # Linux)  jetbrains_dir="$HOME/.config/JetBrains" ;;
  *)      echo "only osx is supported"; exit ;;
esac

cp -rf "${settings_dir}/snippets/"         "./snippets/"
cp  -f "${settings_dir}/settings.json"     "./settings.jsonc"
cp  -f "${settings_dir}/keybindings.json"  "./keybindings.jsonc"

cursor --list-extensions > "./extensions.txt"
