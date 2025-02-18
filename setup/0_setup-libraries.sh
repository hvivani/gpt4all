#!/bin/bash

set -e

echo "###adding necessary libraries..."
sudo apt-get -y install libxcb-icccm4 libfontconfig1 libxcb-glx0 libx11-xcb1 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-shape0 libxcb-sync1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xkb1 libxkbcommon-x11-0 libgl1

echo "###developer libraries..."
sudo apt -y install make g++ pkg-config libgl1-mesa-dev libxcb*-dev libfontconfig1-dev libxkbcommon-x11-dev libgtk-3-dev

echo "###build esentials..."
sudo apt-get -y install build-essential cmake

echo "###python 2..."
sudo apt-get -y install python3-pip

echo "###adding vulkan libraries..."
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list http://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
sudo apt update
sudo apt  -y install vulkan-sdk

echo "###training libraries..."
pip3 install transformers deepspeed accelerate datasets einops torchmetrics evaluate wandb peft nodelist-inflator sentencepiece jsonlines nomic scikit-learn matplotlib
