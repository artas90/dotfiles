# Ubuntu 18.04 LTS
FROM ubuntu:bionic

# required
ARG GITLAB_TOKEN

# optional
ARG SSH_PUBLIC_KEY
ARG SSH_PRIVATE_KEY
ARG http_proxy
ARG https_proxy
ENV http_proxy $http_proxy
ENV https_proxy $https_proxy

RUN apt-get update && \
    apt-get -yy install build-essential git tig curl wget mc tmux zsh python3

RUN (test -n "${SSH_PUBLIC_KEY}" && test -n "${SSH_PRIVATE_KEY}") && ( \
      mkdir -p ~/.ssh && \
      touch ~/.ssh/config && \
      echo 'Host gitlab.com' >> ~/.ssh/config && \
      echo '  HostName gitlab.com' >> ~/.ssh/config && \
      echo '  User git' >> ~/.ssh/config && \
      echo '  IdentityFile ~/.ssh/id_rsa' >> ~/.ssh/config && \
      echo "${SSH_PUBLIC_KEY}" > ~/.ssh/id_rsa.pub && \
      echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_rsa \
    ) || true && \
    ssh-keyscan gitlab.com > ~/.ssh/known_hosts && \
    chmod -R 600 ~/.ssh

RUN git clone https://oauth2:${GITLAB_TOKEN}@gitlab.com/artas90/dotfiles.git  ~/.dotfiles && \
    sh -c 'cd ~/.dotfiles/configs/git && zsh ./setup.sh' && \
    sh -c 'cd ~/.dotfiles/configs/tig && zsh ./setup.sh' && \
    sh -c 'cd ~/.dotfiles/configs/mc && zsh ./setup.sh' && \
    sh -c 'cd ~/.dotfiles/configs/tmux && zsh ./setup.sh' && \
    sh -c 'cd ~/.dotfiles/configs/micro && zsh ./setup.sh' && \
    sh -c 'cd ~/.dotfiles/configs/fzf && zsh ./setup.sh' && \
    zsh ~/.dotfiles/zsh/init.zsh || true && \
    echo 'source ~/.dotfiles/zsh/init.zsh' > ~/.zshrc && \
    chsh -s /bin/zsh

ENTRYPOINT [ "/bin/zsh" ]
