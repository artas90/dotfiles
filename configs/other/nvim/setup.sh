#!/bin/sh

git clone https://github.com/NvChad/NvChad ~/.config/nvim

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

# mkdir -p $HOME/.config/nvim/lua/custom

_chadrc_to="$HOME/.config/nvim/lua/custom/chadrc.lua"
cp -f "$(pwd)/chadrc.lua" $_chadrc_to
echo "Copied to $_chadrc_to"

_init_to="$HOME/.config/nvim/lua/custom/init.lua"
cp -f "$(pwd)/init.lua" $_init_to
echo "Copied to $_init_to"
