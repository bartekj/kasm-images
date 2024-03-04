#!/usr/bin/env bash
set -ex

curl -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash

sudo apt-get install mattermost-desktop

sed -i 's,/opt/Mattermost/mattermost-desktop,/opt/Mattermost/mattermost-desktop --no-sandbox,g' /usr/share/applications/mattermost-desktop.desktop
cp /usr/share/applications/mattermost-desktop.desktop $HOME/Desktop/ 
chmod +x $HOME/Desktop/mattermost-desktop.desktop
chown 1000:1000 $HOME/Desktop/mattermost-desktop.desktop

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