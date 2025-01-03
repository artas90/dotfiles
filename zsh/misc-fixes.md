### fix line endings
```sh
find . -name "*.zsh" | xargs dos2unix -f
find . -name "*.sh" | xargs dos2unix -f
```

### fix permissions
```sh
autoload -Uz compinit
compaudit | xargs chmod g-w,o-w
```

### fix zshrc loading in IDEs
```sh
sudo su
echo 'source "$HOME/.zshrc"' > /etc/zshrc_zed
echo 'source "$HOME/.zshrc"' > /etc/zshrc_vscode
```
