#!/bin/bash

set -e

#References: https://docs.docker.com/engine/install/ubuntu/
# https://github.com/nomic-ai/gpt4all/issues/1396
# https://docs.gpt4all.io/gpt4all_chat.html#server-mode

# Installing dependency packages:
pip3 install aiohttp aiofiles pydantic requests ujson fastapi Jinja2 gpt4all pytest openai black isort python-dotenv

# Remove wrong docker packages:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start docker daemon

 sudo dockerd&

# Test docker:
 sudo docker run hello-world

echo "REMEMBER to configure /gpt4all-api/gpt4all_api/env file"
