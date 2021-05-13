#!/bin/sh
mkdir -p "$HOME/.config"

to="$HOME/.config/starship.toml"
cp -f "$(pwd)/starship.toml" $to
echo "Copied to $to"
