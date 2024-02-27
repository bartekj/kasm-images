#!/usr/bin/env bash
set -ex

curl -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash

sudo apt-get install mattermost-desktop
