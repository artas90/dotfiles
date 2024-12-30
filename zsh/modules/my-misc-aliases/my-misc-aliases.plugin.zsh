alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias grepr="GREP_COLOR='1;31' grep --color=always"
alias grepg="GREP_COLOR='1;32' grep --color=always"
alias grepy="GREP_COLOR='1;33' grep --color=always"
alias grepb="GREP_COLOR='1;34' grep --color=always"
alias grepm="GREP_COLOR='1;35' grep --color=always"
alias grepc="GREP_COLOR='1;36' grep --color=always"

alias zshrc-custom-encrypt="cat ~/.dotfiles/zsh/_local.zsh | age --encrypt --armor --passphrase"
alias syncto="dfb-syncto"
alias podps="podman ps --format 'table {{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Names}}'"
alias y="yazi"

ps5() {
  ps aux | sort -nrk 3,3 | head -n 5
}

mo() {
  micro $(fzf --reverse --height 40%)
}

pathadd() {
  if [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

dfb-chmodx() {
  for f in `ls $HOME/.dotfiles/bin | grep -v .gitignore | grep -v tmp`
  do
    chmod +x "$HOME/.dotfiles/bin/$f"
    echo "$f"
  done
}

dfb-var-set() {
  local name="$1"
  local val="$2"

  if [ -z "$name" ] || [ -z "$val" ]; then
    echo 'Usage: dfb-var-set name value'
    return
  fi

  local fname="$HOME/.dotfiles/.vars/$name"
  printf '%s' "$val" > "$fname"
}

dfb-var() {
  local name="$1"
  local askorsilent="$2"

  local fname="$HOME/.dotfiles/.vars/$name"
  local val=""

  if [ -e $fname ]; then
    val=`cat $fname | xargs`
  fi

  if [ -n "$val" ] || [ "$askorsilent" = "--silent" ]; then
    eval "export $name=\"$val\""
    return
  fi

  if [ -z "$val" ] || [ "$askorsilent" = "--ask" ]; then
    local newval=""
    read "newval?Please enter $name ($val): "
    if [ -n "$newval" ]; then
      val="$newval"
      dfb-var-set "$name" "$val"
    fi
  fi

  if [ -z "$val" ]; then
    dfb-var "$name"
    return
  fi
}

s3put() {
  if [ -z "$S3_DEFAULT_BUCKET" ]; then
    echo "Please set $S3_DEFAULT_BUCKET variable"
    return
  fi

  local filename="$1"
  if [ -z "$filename" ]; then
    echo "Usage: s3put somefile.png"
    return
  fi

  s3cmd put --acl-public --guess-mime-type $filename $S3_DEFAULT_BUCKET
}

kill-by-grep() {
  local process_name="$1"

  if [ -z "$process_name" ] ; then
    echo 'Usage: kill-by-grep <process-grep>'
    return
  fi

  ps aux | grep "$process_name" | grep -v grep | awk '{print $2}' | xargs kill -9
}

if [[ $OSTYPE == linux-* ]]; then
  open() {
    (xdg-open "$1" &> /dev/null &)
  }
fi

if [[ $OSTYPE == darwin* ]]; then
  osx-fix-menu-items() {
    local CoreServices="/System/Library/Frameworks/CoreServices.framework"
    local LaunchServices="${CoreServices}/Versions/A/Frameworks/LaunchServices.framework"
    local lsregister="${LaunchServices}/Versions/A/Support/lsregister"
    sudo $lsregister -kill -r -domain local -domain system -domain user
  }
fi

# _alvim() {
#   alacritty --title nvim --working-directory $(pwd) -e $SHELL -lc "nvim"
# }
# alias alvim="(_alvim &)"

# list all zsh autocompletions
# for command in ${(k)_comps}; do
#   completions=${_comps[$command]}
#   printf "%-32s %s\n" $command $completions
# done | sort
