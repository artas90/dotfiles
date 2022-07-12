#!/bin/sh
mkdir -p $HOME/.config/alacritty

_yml_to="$HOME/.config/alacritty/alacritty.yml"
cp -f "$(pwd)/alacritty.yml" $_yml_to
echo "Copied to $_yml_to"
