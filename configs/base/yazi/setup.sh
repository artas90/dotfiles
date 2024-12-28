#!/bin/sh
mkdir -p $HOME/.config/yazi

rm -rf $HOME/.config/yazi/flavors
git clone https://github.com/yazi-rs/flavors.git $HOME/.config/yazi/flavors

_cfg_to="$HOME/.config/yazi/yazi.toml"
cp -f "$(pwd)/yazi.toml" $_cfg_to
echo "Created $_cfg_to"

_theme_to="$HOME/.config/yazi/theme.toml"
cp -f "$(pwd)/theme.toml" $_theme_to
echo "Created $_theme_to"
