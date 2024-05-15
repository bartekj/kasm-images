#!/usr/bin/env bash
set -ex

apt update
apt install -y fonts-powerline fonts-firacode

cd /tmp

curl -s https://api.github.com/repos/starship/starship/releases/latest \
  | grep browser_download_url \
  | grep x86_64-unknown-linux-gnu \
  | cut -d '"' -f 4 \
  | wget -qi -

tar xvf starship-*.tar.gz
mv starship /usr/local/bin/

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi
