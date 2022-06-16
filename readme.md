# dotfiles

### 1. clone repo
```sh
git clone https://github.com/artas90/dotfiles.git ~/.dotfiles
```

### 2. update ~/.zshrc
```sh
echo 'source ~/.dotfiles/zsh/init.zsh' > ~/.zshrc && \
touch ~/.zshrc_custom
```

### 3. copy configs
```sh
cd ~/.dotfiles/configs && bash setup-base.sh
```

### 4. update config.fish
```sh
curl -sL https://git.io/fisher | source && \
fisher install jorgebucaran/fisher && \
echo 'source ~/.dotfiles/fish/init.fish' > ~/.config/fish/config.fish
```

### 5. optional
```
# custom prompt
echo 'eval "$(starship init zsh)"' >> ~/.zshrc_custom

# only for zsh on mac
brew install nvm
```
