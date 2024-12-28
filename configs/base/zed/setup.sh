#!/bin/sh
mkdir -p "$HOME/.config/zed"

cpzed() {
  local to="$HOME/.config/zed/$1"
  cp -f "$(pwd)/$1" $to
  echo "Created $to"
}

cpzed "settings.json"
cpzed "keymap.json"
