# ---- basic config ----

unsetopt AUTO_NAME_DIRS        # Don't collapse the path to the alias
setopt   NO_BEEP               # Disabe sound on autocomplete fails
setopt   HIST_IGNORE_ALL_DUPS  # Ignore all occurrences of commands
setopt   HIST_IGNORE_SPACE     # Ignore extra spaces
setopt   HIST_REDUCE_BLANKS    # Remove blank lines from history

export LC_ALL=en_US.UTF-8
export EDITOR=micro
export VISUAL=micro

if is-vscode; then
  export EDITOR="code --wait"
  export VISUAL="code --wait"
elif is-zed; then
  export EDITOR="zed --wait"
  export VISUAL="zed --wait"
elif is-msys; then
  export EDITOR="nano"
  export VISUAL="nano"
fi

# ---- external configs ----

export ZSH_PYENV_QUIET=true
export DENO_FUTURE=1

# ---- my configs ----

export S3_DEFAULT_BUCKET="s3://..."

# ---- misc ----

pathadd "$HOME/.dotfiles/bin"
pathadd "$HOME/.deno/bin"

# use gnu version of utils(find, grep, aws, etc.) on osx by default
# if [ `type gfind &>/dev/null && echo 1` ]; then
#   GNUBINS=`gfind -L /usr/local/opt -maxdepth 3 -type d -name gnubin -printf '%p:'`
#   GNUMANPATH=`gfind -L /usr/local/opt -maxdepth 3 -type d -name gnuman -printf '%p:'`

#   export PATH="$GNUBINS$PATH"
#   export MANPATH="$GNUMANPATH$MANPATH"
# fi

# optional config
[ -f ~/.dotfiles/zsh/_local.zsh ] && source ~/.dotfiles/zsh/_local.zsh
