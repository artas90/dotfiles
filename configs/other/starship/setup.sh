#!/bin/sh
to="$HOME/.config/starship.toml"
cp -f "$(pwd)/starship.toml" $to
echo "Copied to $to"
