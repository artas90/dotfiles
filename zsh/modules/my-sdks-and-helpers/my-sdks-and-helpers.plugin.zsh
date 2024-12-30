# brew install nvm pyenv android-studio

# -- -- setup nvm -- -- -- --

# if [ "$(uname)" = "Darwin" ]; then
#   export NODE_PATH="/usr/local/lib/node_modules"
#   export NVM_DIR=~/.nvm

#   _nvmsh=$(brew --prefix nvm)/nvm.sh
#   [ -s "$_nvmsh" ] && \. "$_nvmsh"

# else
#   # https://github.com/nvm-sh/nvm#installation-and-update

#   export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] \
#     && printf %s "${HOME}/.nvm" \
#     || printf %s "${XDG_CONFIG_HOME}/nvm")"

#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# fi

# -- -- setup pyenv -- -- -- --

# if command -v pyenv &> /dev/null ; then
#   if [ -d "$PYENV_ROOT/bin" ]; then
#     export PATH="$PYENV_ROOT/bin:$PATH"
#   fi

#   eval "$(pyenv init -)"
# fi

# -- -- setup jdk -- -- -- --

if [ -z "$JAVA_HOME" ] && [ -f "/usr/libexec/java_home" ] ; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

_jbr="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
if  [ -z "$JAVA_HOME" ] && [ -d "$_jbr" ] ; then
  export JAVA_HOME="$_jbr"
fi

# -- -- carapace for autocompletions -- -- -- --

if command -v carapace &> /dev/null; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# -- -- smarter cd command -- -- -- --

if command -v zoxide &>/dev/null; then
  export _ZO_DATA_DIR="$HOME/.local/share"
  source <(zoxide init zsh)
fi
