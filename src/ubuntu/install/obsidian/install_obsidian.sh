#!/usr/bin/env bash
set -ex
curl -Lso obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.8/obsidian_1.5.8_amd64.deb
apt install -y ./obsidian.deb
sed -i 's#/opt/Obsidian/obsidian#/opt/Obsidian/obsidian --no-sandbox##' /usr/share/applications/obsidian.desktop
cp /usr/share/applications/obsidian.desktop $HOME/Desktop
chmod +x $HOME/Desktop/obsidian.desktop
chown 1000:1000 $HOME/Desktop/obsidian.desktop
rm obsidian.deb