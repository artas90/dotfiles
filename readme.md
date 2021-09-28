# dotfiles

### 1. clone repo
```sh
git clone https://github.com/artas90/dotfiles.git ~/.dotfiles
# OR
git clone https://oauth2:__token__@gitlab.com/artas90/dotfiles.git ~/.dotfiles
```

### 2. copy configs
```sh
cd ~/.dotfiles/configs && bash setup-base.sh
```

### 3. update ~/.zshrc
```sh
mv ~/.zshrc ~/.zshrc.old
echo 'source ~/.dotfiles/zsh/init.zsh' > ~/.zshrc
touch ~/.zshrc_custom

# (optional) custom prompt
echo 'eval "$(starship init zsh)"' >> ~/.zshrc_custom

# (optional) only for zsh on mac
brew install nvm
```

### 4. update config.fish
```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo 'source ~/.dotfiles/fish/init.fish' > ~/.config/fish/config.fish
```
