#!/bin/sh

_init=`test ! -d "$HOME/.config/nvim" && echo 1`

# -- general config initial clone --
mkdir -p $HOME/.config
test -n "$_init" && git clone https://github.com/NvChad/NvChad ~/.config/nvim

# -- copy configs --
mkdir -p $HOME/.config/nvim/lua/custom

_chadrc_to="$HOME/.config/nvim/lua/custom/chadrc.lua"
cp -f "$(pwd)/chadrc.lua" $_chadrc_to
echo "Copied to $_chadrc_to"

_init_to="$HOME/.config/nvim/lua/custom/init.lua"
cp -f "$(pwd)/init.lua" $_init_to
echo "Copied to $_init_to"

# -- initial setup --
test -n "$_init" && nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
