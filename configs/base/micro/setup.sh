#!/bin/sh
mkdir -p "$HOME/.config/micro"

to="$HOME/.config/micro/settings.json"
cp -f "$(pwd)/settings.json" $to
echo "Copied to $to"
