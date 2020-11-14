# cmder config
```yaml
- Fonts
  Cascadia Code PL
  Size 18
- Appearance
  Show buttons -
  Show search -
- Tab bar
  Tab on bottom +
- Task bar
  Show overlay -
- Colors
  Schemes = xterm
  Fade when inactive -
- Status bar
  Show status bar -
```

# conemu tasks

## icon
```
/icon "X:\MyWorkspace\.myws\files\shell.ico"
```

## my :: powershell
```
clone default powershell
```

## my :: msys2 :: zsh
```bash
# console cmd
X:\MyWorkspace\apps\msys64\usr\bin\mintty.exe /usr/bin/zsh --login
```

## my :: workspace (can be generated)
```
> -cur_console:f      -cur_console:d:C:\MyWorkspace\projects\fe -cur_console:t:run  -cur_console:C:C:\MyWorkspace\.myws\files\shell.ico PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression 'Import-Module ''%ConEmuDir%\..\profile.ps1'''"

  -cur_console:bs1T34V -cur_console:d:C:\MyWorkspace\projects\fe -cur_console:t:misc -cur_console:C:C:\MyWorkspace\.myws\files\shell.ico C:\MyWorkspace\apps\msys64\usr\bin\mintty.exe --dir C:\MyWorkspace\projects\fe /usr/bin/zsh --login

  -cur_console:bs3T53H -cur_console:d:C:\MyWorkspace\projects\fe  -cur_console:t:git -cur_console:C:C:\MyWorkspace\.myws\files\shell.ico PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression 'Import-Module ''%ConEmuDir%\..\profile.ps1'''"
```
