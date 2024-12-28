#!/bin/sh
mkdir -p "$HOME/.config/ghostty"

to="$HOME/.config/ghostty/config"
cp -f "$(pwd)/config" $to
echo "Created $to"
