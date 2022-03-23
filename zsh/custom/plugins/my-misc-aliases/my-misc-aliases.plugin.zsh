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

alias y="yarn"
alias yr="yarn run"

ps5() {
  ps aux | sort -nrk 3,3 | head -n 5
}

mo() {
  micro $(fzf --reverse --height 40%)
}

s3put() {
  s3cmd put --acl-public --guess-mime-type $1 $S3_DEFAULT_BUCKET
}

syncto() {
  if [ -z "$1" ] || [ -z "$2" ] ; then
    echo 'Usage: syncto <local-path> <ssh-alias>:<remote-path>'
    return
  fi

  echo "Syncing $1 with $2..."
  rg -l $1 | entr rsync -vuar $1 $2
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
  osx_fix_menu_items() {
    local lsframework="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework"
    local lsregister="$lsframework/Versions/A/Support/lsregister"
    sudo $lsregister -kill -r -domain local -domain system -domain user
  }
fi
