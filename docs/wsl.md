### install wsl

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu1804.appx -UseBasicParsing

Add-AppxPackage .\Ubuntu1804.appx
```

### run Ubuntu from menu

### add windows terminal config

```json
[
  {
      "guid": "{12345678-1234-1234-1234-123456789012}",
      "hidden": false,
      "name": "Ubuntu-18.04",
      "source": "Windows.Terminal.Wsl"
  }
]
```

### wsltty
```powershell
cd $env:myws\files\downloads
.\wsltty-*.exe /C /T:$env:myws\_wsl

cd $env:myws\_wsl
.\install.bat $env:myws\apps\wsltty\app $env:myws\apps\wsltty\cfg
```

### misc
```cmd
mklink /d D:\WslWorkspace \\wsl$\Ubuntu-20.04\home\__USER__\WslWorkspace

netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=4000 connectaddress=192.168.101.100
```

### gui
```bash
### WSL commands:
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

### Ubuntu GUI commands:
sudo apt update && sudo apt -y upgrade
sudo apt-get purge xrdp
sudo apt install -y xrdp
sudo apt install -y xfce4
sudo apt install -y xfce4-goodies

### Config
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
echo xfce4-session > ~/.xsession

### startwm
sudo nano /etc/xrdp/startwm.sh

# comment these lines to:
<--
# test -x /etc/X11/Xsession && exec /etc/X11/Xsession
# exec /bin/sh /etc/X11/Xsession
-->

# add these lines:
<--
# xfce
startxfce4
-->

### start xrdp
sudo /etc/init.d/xrdp start

### windows
Now in Windows, use Remote Desktop Connection
localhost:3390
then login using your Ubuntu username and password
```
