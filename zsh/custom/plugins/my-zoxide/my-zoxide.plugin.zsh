# based on https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/zoxide/zoxide.plugin.zsh

if (( $+commands[zoxide] )); then
  export _ZO_DATA_DIR="$HOME/.local/share"
  eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-z} zsh)"
fi
