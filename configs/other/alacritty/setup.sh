#!/bin/sh
mkdir -p $HOME/.config/alacritty

_toml_to="$HOME/.config/alacritty/alacritty.toml"
cp -f "$(pwd)/alacritty.toml" $_toml_to
echo "Created $_toml_to"
