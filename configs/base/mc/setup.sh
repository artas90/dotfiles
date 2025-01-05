#!/bin/sh
mkdir -p "$HOME/.config/mc" "$HOME/.local/share/mc/skins"

cpcofg() {
  local to="$HOME/.config/mc/$1"
  cp -f "$(pwd)/$1" $to
  echo "Created $to"
}
cpskin() {
  local to="$HOME/.local/share/mc/$1"
  cp -f "$(pwd)/$1" $to
  echo "Created $to"
}

cpcofg "ini"
cpcofg "mc.keymap"
cpskin "skins/darkened.ini"
cpskin "skins/zenburn.ini"
