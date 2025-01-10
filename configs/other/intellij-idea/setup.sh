#!/bin/sh

REPLACE=""

for i in "$@"; do
  case $i in
    --replace) REPLACE="(replaced)"; shift;;
    *) ;;
  esac
done

case "$(uname -s)" in
  Darwin) jetbrains_dir="$HOME/Library/Application Support/JetBrains" ;;
  Linux)  jetbrains_dir="$HOME/.config/JetBrains" ;;
  *)      echo "only osx or linux is supported"; exit ;;
esac

ide_version=`ls "${jetbrains_dir}" | grep "IdeaIC" | grep -v backup | tail -n1`
if [ -z "${ide_version}" ]; then
  ide_version="IdeaIC2024.1"
fi

settings_dir="${jetbrains_dir}/${ide_version}"
if [ -n "${REPLACE}" ]; then
  rm -rf "${settings_dir}" && mkdir "${settings_dir}"
else
  echo "top replace settings run:"
  echo "  bash setup.sh --replace"
fi

cp -rf ./settings/* "${settings_dir}"
echo "Created '${settings_dir}' ${REPLACE}"
