### setup node on ubuntu

```bash
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
sudo sh -c "echo deb https://deb.nodesource.com/node_10.x disco main > /etc/apt/sources.list.d/nodesource.list"

sudo apt-get update
sudo apt-get install nodejs mc git zsh
```

### config

```powershell
npm config edit

npm config set cache C:\MyWorkspace\etc\npm-cache --global

npm config set proxy http://127.0.0.1:3128
npm config set https-proxy http://127.0.0.1:3128

npm config edit

registry=https://nexus.company.com/repository/efxnpm/
proxy=http://127.0.0.1:3128/
https-proxy=http://127.0.0.1:3128/
```
