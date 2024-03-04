#!/usr/bin/env bash
set -ex

wget --no-hsts -P /etc/apt/sources.list.d/ http://dl.thorium.rocks/debian/dists/stable/thorium.list 
apt update

apt install thorium-browser

cp /usr/share/applications/thorium-browser.desktop $HOME/Desktop/ 
chmod +x $HOME/Desktop/thorium-browser.desktop
chown 1000:1000 $HOME/Desktop/thorium-browser.desktop

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