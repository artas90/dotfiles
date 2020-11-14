# msys64 :: pacman
```bash
pacman -Syy
pacman -S mc git zsh nano python patch
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-jq
# optional
pacman -S winpty tmux
```

# zsh
```bash
# ~/.zshrc
source ~/.dotfiles/zsh/init.zsh

# ~/.zshrc_custom
export myws="/x/MyWorkspace"
source $myws/.myws/env-setup.sh
```

# zsh (optional)
```bash
# ~/.bashrc
if [ -t 1 ]; then
  exec zsh
fi

# compaudit
sudo chown -R `whoami`:`whoami` $HOME/.dotfiles/.tmp
sudo chmod -R 755 $HOME/.dotfiles/.tmp
```

# my :: powershell
```powershell
# Put to X:\MyWorkspace\apps\cmder\config\user_profile.ps1
$env:myws = "X:\MyWorkspace"
. ("$env:myws\.myws\env-setup.ps1")
```

# powershell :: git extentions
```powershell
Install-Module posh-git -Scope CurrentUser
```
