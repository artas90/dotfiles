#!/bin/sh
set -euo pipefail

function version {
  echo "$1" | awk -F. '{ printf("%04d%04d%04d%04d", $1,$2,$3,$4); }'
}

tmux_ver=`tmux -V | cut -d ' ' -f 2-`

if [ $(version $tmux_ver) -ge $(version "2.9") ]; then
  from="_tmux-ge-29.conf"
else
  from="_tmux-lt-29.conf"  
fi

to="$HOME/.tmux.conf"
cp -f `pwd`"/$from" $to
echo "Copied $from to $to"
