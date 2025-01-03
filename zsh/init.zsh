export ZDOTDIR="${HOME}/.dotfiles/zsh"
export fpath=("${fpath[@]}" "${ZDOTDIR}/functions")
zstyle ':prezto:load' pmodule-dirs "${ZDOTDIR}/modules"

(
  if [ -d "${ZDOTDIR}/.zprezto" ]; then; return; fi

  echo "Installing prezto"
  local rel="https://raw.githubusercontent.com/artas90/pkgs/refs/heads/main/prezto/VERSION"
  local ver=`curl -sL "${rel}" | xargs`
  local pkg="https://artas90.github.io/pkgs/prezto/prezto-${ver}.tgz"
  curl -sL "${pkg}" | tar xz -C "${ZDOTDIR}"
)

source "${ZDOTDIR}/.zprezto/init.zsh"
