# ---- zsh config ----

unsetopt AUTO_NAME_DIRS        # Don't collapse the path to the alias
setopt   NO_BEEP               # Disabe sound on autocomplete fails
setopt   HIST_IGNORE_ALL_DUPS  # Ignore all occurrences of commands
setopt   HIST_IGNORE_SPACE     # Ignore extra spaces
setopt   HIST_REDUCE_BLANKS    # Remove blank lines from history

# ---- external configs ----

export ZSH_PYENV_QUIET=true
export DENO_FUTURE=1

# ---- my configs ----

S3_DEFAULT_BUCKET="s3://..."

# ---- init zsh ----

export ZDOTDIR="${HOME}/.dotfiles/zsh"
export fpath=("${fpath[@]}" "${ZDOTDIR}/functions")
zstyle ':prezto:load' pmodule-dirs "${ZDOTDIR}/modules"

_preztoinit() {
  if [ -d "${ZDOTDIR}/.zprezto" ]; then; return; fi

  echo "Installing prezto"
  local rel="https://raw.githubusercontent.com/artas90/pkgs/refs/heads/main/prezto/VERSION"
  local ver=`curl -sL "${rel}" | xargs`
  local pkg="https://artas90.github.io/pkgs/prezto/prezto-${ver}.tgz"
  curl -sL "${pkg}" | tar xz -C "${ZDOTDIR}"
}
_preztoinit; unset _preztoinit

source "${ZDOTDIR}/.zprezto/init.zsh"

# ---- general config ----

export LC_ALL=en_US.UTF-8
export EDITOR=micro
export VISUAL=micro

if [[ $OSTYPE == msys* ]]; then
  export EDITOR=nano
  export VISUAL=nano
fi

# use gnu version of utils(find, grep, aws, etc.) on osx by default
# if [ `type gfind &>/dev/null && echo 1` ]; then
#   GNUBINS=`gfind -L /usr/local/opt -maxdepth 3 -type d -name gnubin -printf '%p:'`
#   GNUMANPATH=`gfind -L /usr/local/opt -maxdepth 3 -type d -name gnuman -printf '%p:'`

#   export PATH="$GNUBINS$PATH"
#   export MANPATH="$GNUMANPATH$MANPATH"
# fi

pathadd "$HOME/.dotfiles/bin"
pathadd "$HOME/.deno/bin"

# optional config
[ -f ~/.dotfiles/zsh/_local.zsh ] && source ~/.dotfiles/zsh/_local.zsh
