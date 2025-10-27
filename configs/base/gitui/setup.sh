#!/bin/sh
mkdir -p "$HOME/.config/gitui"

to="$HOME/.config/gitui/key_bindings.ron"
cp -f "$(pwd)/key_bindings.ron" $to
echo "Created $to"
