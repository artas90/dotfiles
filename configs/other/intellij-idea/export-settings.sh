#!/usr/bin/bash

case "$(uname -s)" in
  Darwin) jetbrains_dir="$HOME/Library/Application Support/JetBrains" ;;
  Linux)  jetbrains_dir="$HOME/.config/JetBrains" ;;
  *)      echo "only osx or linux is supported"; exit ;;
esac

ide_version=`ls "${jetbrains_dir}" | grep "IdeaIC" | grep -v backup | tail -n1`
settings_dir="${jetbrains_dir}/${ide_version}"

cp -rf "${settings_dir}/options" "./settings"
cp -rf "${settings_dir}/keymaps" "./settings"
