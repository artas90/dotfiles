#!/bin/sh

mkdir -p $HOME/.config
git clone https://github.com/skyfalconua/nvim-config.git ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
