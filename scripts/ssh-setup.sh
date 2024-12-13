#!/bin/bash
SSH_PRIVATE_KEY="$1"
SSH_HOST="$2"

command -v ssh-agent >/dev/null
eval $(ssh-agent -s)
echo "${SSH_PRIVATE_KEY}" | tr -d '\r' | ssh-add -
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan "$SSH_HOST" > ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
ssh-add -l
