_setup() { (echo "---- $1 ----" && cd base/$1 && bash setup.sh) }

_setup nano
_setup git
_setup tig
_setup mc
_setup fzf
_setup tmux

unset _setup
