#!/bin/sh

REPLACE=""

for i in "$@"; do
  case $i in
    --replace) REPLACE="(replaced)"; shift;;
    *) ;;
  esac
done

case "$(uname -s)" in
  Darwin) userdir="$HOME/Library/Application Support/Code/User" ;;
  # Linux)  jetbrains_dir="$HOME/.config/..." ;;
  *)      echo "only osx is supported"; exit ;;
esac

mkdir -p "$userdir"

if [ -n "${REPLACE}" ]; then
  rm -rf "${userdir}" && mkdir "${userdir}"
elif [ ! -d "$userdir" ]; then
  mkdir "$userdir"
else
  echo "note: to replace settings run:"
  echo "  bash setup.sh --replace"
fi

cp -rf ./user-settings/* "${userdir}"
echo "Created '${userdir}' ${REPLACE}"
