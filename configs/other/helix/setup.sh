#!/bin/sh
mkdir -p $HOME/.config/helix
_hx_to="$HOME/.config/helix/config.toml"
cp -f "$(pwd)/config.toml" $_hx_to
echo "Created $_hx_to"
