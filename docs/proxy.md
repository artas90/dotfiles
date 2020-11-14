### proxy

```bash
export http_proxy=http://127.0.0.1:3128
export https_proxy=http://127.0.0.1:3128

sudo touch /etc/apt/apt.conf.d/proxy.conf
sudo nano /etc/apt/apt.conf.d/proxy.conf
> Acquire::http::Proxy "http://127.0.0.1:3128";
> Acquire::https::Proxy "http://127.0.0.1:3128";

git config --global http.proxy http://127.0.0.1:3128
git config --global https.proxy http://127.0.0.1:3128
# OR
git config http.proxy http://127.0.0.1:3128
git config https.proxy http://127.0.0.1:3128

npm config set proxy http://127.0.0.1:3128
npm config set https-proxy http://127.0.0.1:3128

# -- or --

export http_proxy=http://127.0.0.1:8888
export https_proxy=http://127.0.0.1:8888

npm config set proxy http://127.0.0.1:8888
npm config set https-proxy http://127.0.0.1:8888
```

### vscode

```
C:\MyWorkspace\apps\VSCode\Code.exe --proxy-server=http://127.0.0.1:3128
```

### docker

```bat
set DOCKER_HOST=tcp://192.168.99.100:2376
set DOCKER_TLS_VERIFY=1
```
