#!/bin/sh

case "$(uname -s)" in
  Darwin) settings_dir="$HOME/Library/Application Support/Cursor/User" ;;
  # Linux)  jetbrains_dir="$HOME/.config/JetBrains" ;;
  *)      echo "only osx is supported"; exit ;;
esac

mkdir -p "${settings_dir}"

cp -rf  "./snippets/"          "${settings_dir}/snippets/"
cp  -f  "./settings.jsonc"     "${settings_dir}/settings.json"
cp  -f  "./keybindings.jsonc"  "${settings_dir}/keybindings.json"

for ext in $(cat "./extensions.txt"); do
  cursor --install-extension "$ext"
done

echo "Created '${settings_dir}'"
