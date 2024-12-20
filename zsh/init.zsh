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

# ---- zsh utils ----

plugins=()

_zsh_init() {
  local zsh_tmp="$HOME/.dotfiles/.tmp/zsh"

  export ZSH="$zsh_tmp/oh-my-zsh"
  export ZSH_CUSTOM="$zsh_tmp/custom"

  if [ ! -d $ZSH ]; then
    echo "Install oh-my-zsh and plugins"
    mkdir -p $zsh_tmp
    git clone https://github.com/robbyrussell/oh-my-zsh.git --depth 1 "$ZSH"
    cp -r $HOME/.dotfiles/zsh/custom "$ZSH_CUSTOM"
  fi
}

_zsh_add_plugin() {
  local repo_name=""
  for repo_name in "$@"; do
    plugins+=($repo_name)
  done
}

_zsh_load_plugin() {
  local repo="$1"
  local repo_name=`basename $repo`
  local repo_dir="$ZSH_CUSTOM/plugins/$repo_name"

  if [ ! -d $repo_dir ]; then
    echo "Install $repo_name"
    git clone https://github.com/$repo --depth 1 $repo_dir
  fi

  _zsh_add_plugin "$repo_name"
}

# ---- core utils ----

pathadd() {
  if [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

# ---- init oh-my-zsh ----

_zsh_init

_zsh_add_plugin pyenv python pip poetry
_zsh_add_plugin nvm node npm yarn ng
_zsh_add_plugin docker podman rust
_zsh_add_plugin fzf ssh gitfast urltools qrcode

#_zsh_load_plugin "chrissicool/zsh-256color"
#_zsh_load_plugin "zsh-users/zsh-syntax-highlighting"

if [[ $OSTYPE == darwin* ]]; then
  _zsh_add_plugin "brew"
  # _zsh_load_plugin "mgryszko/jvm"
fi

_zsh_add_plugin my-zoxide my-scm-branch my-sdks my-misc-aliases

if [[ `whoami` == root ]] && [ ! -f /.dockerenv ]; then
  ZSH_THEME="my-zsh-theme-red"
else
  ZSH_THEME="my-zsh-theme-yellow"
fi

source $ZSH/oh-my-zsh.sh

# ---- misc helpers ----

# use carapace for autocompletions
if command -v carapace &> /dev/null; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# a smarter cd command
if command -v zoxide &>/dev/null; then
  source <(zoxide init zsh)
fi

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
