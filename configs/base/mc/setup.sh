#!/bin/sh
mkdir -p "$HOME/.local/share/mc/skins"

to="$HOME/.local/share/mc/skins/darkened.ini"
cp -f "$(pwd)/skins/darkened.ini" $to
echo "Created $to"

to="$HOME/.local/share/mc/skins/zenburn.ini"
cp -f "$(pwd)/skins/zenburn.ini" $to
echo "Created $to"
