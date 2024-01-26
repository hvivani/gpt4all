#!/bin/bash

set -e

## References: https://github.com/hvivani/gpt4all/tree/main/gpt4all-api

cd /home/ubuntu/gpt4all/gpt4all-api

## run only once:
# sudo DOCKER_BUILDKIT=1 docker build -t gpt4all_api --progress plain -f gpt4all_api/Dockerfile.buildkit .

## Start the container
sudo docker compose up --build &
