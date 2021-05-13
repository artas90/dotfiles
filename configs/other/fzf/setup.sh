#!/bin/sh

echo 'fzsf: todo upload binaries'

# if [[ $OSTYPE == darwin* ]]; then
#   sudo curl https://.../osx-fzf-0.18.0 -o /usr/local/bin/fzf
#   sudo chmod +x /usr/local/bin/fzf
#   echo 'saved fzf to /usr/local/bin/fzf'
# fi

# if [[ $OSTYPE == linux-* ]]; then
#   sudo curl https://.../linux-fzf-0.18.0 -o /usr/local/bin/fzf
#   sudo chmod +x /usr/local/bin/fzf
#   echo 'saved fzf to /usr/local/bin/fzf'
# fi

sudo git clone --depth 1 https://github.com/junegunn/fzf.git /usr/share/fzf
