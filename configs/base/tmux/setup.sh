#!/bin/sh
to="$HOME/.tmux.conf"
cp -f "$(pwd)/_tmux.conf" $to
echo "Copied to $to"
