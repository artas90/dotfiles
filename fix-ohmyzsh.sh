# fix line endings
find . -name "*.zsh" | xargs dos2unix -f
find . -name "*.sh" | xargs dos2unix -f

# fix permissions
autoload -Uz compinit
compaudit | xargs chmod g-w,o-w
