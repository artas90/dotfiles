#!/bin/sh
to="$HOME/.config/yazi"
mkdir -p "$to"
cp -rf "./."  "$to/."
rm "$to/.dump.sh"
echo "Copied configs $to"
