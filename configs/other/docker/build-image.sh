image_name="ubuntu:my"

echo "Build image $image_name"

if [ -z "$GITLAB_TOKEN" ]; then
  echo 'Set gitlab token before run build. E.g.:'
  echo '  GITLAB_TOKEN="abc123"'
  echo '  OR'
  echo '  $env:GITLAB_TOKEN="abc123";'
  exit
fi

# optional: ssh keys setup
# SSH_PUBLIC_KEY=$(cat $HOME/.ssh/id_rsa.pub)
# SSH_PRIVATE_KEY=$(cat $HOME/.ssh/id_rsa)
# OR
# $env:SSH_PUBLIC_KEY = Get-Content "$HOME\.ssh\id_rsa.pub" -Raw
# $env:SSH_PRIVATE_KEY = Get-Content "$HOME\.ssh\id_rsa" -Raw

# optional: use proxy
# $env:http_proxy = "http://127.0.0.1:3128"
# $env:https_proxy = "http://127.0.0.1:3128"

docker build \
  --build-arg GITLAB_TOKEN="$GITLAB_TOKEN" \
  --build-arg SSH_PUBLIC_KEY="$SSH_PUBLIC_KEY" \
  --build-arg SSH_PRIVATE_KEY="$SSH_PRIVATE_KEY" \
  --build-arg http_proxy="$http_proxy" \
  --build-arg https_proxy="$https_proxy" \
  --tag $image_name .
