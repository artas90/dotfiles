# login

```powershell
cd  google-cloud-sdk\bin

.\gcloud config set auth/disable_ssl_validation True
.\gcloud config set proxy/type http
.\gcloud config set proxy/address 127.0.0.1
.\gcloud config set proxy/port 3128

.\gcloud auth application-default login --no-launch-browser
```

# run app
```
$env:GOOGLE_APPLICATION_CREDENTIALS='\Users\__USER__\AppData\Roaming\gcloud\application_default_credentials.json'
```

# gce instance
```
sudo systemctl stop google-accounts-daemon
sudo systemctl stop google-network-daemon
sudo systemctl stop google-clock-skew-daemon
sudo systemctl stop snapd

sudo systemctl disable ...
```
