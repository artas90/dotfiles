# dotfiles

### 1. clone repo
```sh
git clone https://github.com/artas90/dotfiles.git ~/.dotfiles
# OR
git clone https://oauth2:__token__@gitlab.com/artas90/dotfiles.git ~/.dotfiles
```

### 2. update config.fish
```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo 'source ~/.dotfiles/fish/init.fish' > ~/.config/fish/config.fish
```

### 3. copy configs
```sh
cd ~/.dotfiles/configs && bash setup-base.sh
```

### 4. update ~/.zshrc (optional)
```sh
mv ~/.zshrc ~/.zshrc.old
echo 'source ~/.dotfiles/zsh/init.zsh' > ~/.zshrc

# optional
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# optional
touch ~/.zshrc_custom
```
