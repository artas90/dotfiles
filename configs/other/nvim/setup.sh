#!/bin/sh

mkdir -p $HOME/.config
git clone https://github.com/artas90/nvim-config.git ~/.config/nvim

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

