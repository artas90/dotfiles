#!/bin/sh
mkdir -p "$HOME/.config/htop"

to="$HOME/.config/htop/htoprc"
cp -f "$(pwd)/htoprc" $to
echo "Created $to"
