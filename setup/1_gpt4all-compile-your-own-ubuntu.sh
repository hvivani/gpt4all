#!/bin/bash

set -e

##References:
##source: https://github.com/nomic-ai/gpt4all/issues/682
##local build instructions: https://github.com/nomic-ai/gpt4all/tree/main/gpt4all-bindings/python#local-build-instructions


APP_DIRECTORY="/home/ubuntu/gpt4all"
BUILD_DIRECTORY=$APP_DIRECTORY"/gpt4all-backend/build"

if [ ! -d $APP_DIRECTORY ]; then
  echo "$APP_DIRECTORY does NOT exist. Cloning."
  #git clone --recurse-submodules https://github.com/nomic-ai/gpt4all
  git clone --recurse-submodules https://github.com/hvivani/gpt4all.git
fi

## Compiling gpt4all...
cd $APP_DIRECTORY/gpt4all-backend

if [ ! -d $BUID_DIRECTORY ]; then
  echo "$BUILD_DIRECTORY does NOT exist. Creating."
  mkdir build
fi

cd build
cmake ..
cmake --build . --parallel
ls *.so  # should print 'libllmodel.so'

# setting python bindings:
cd ../../gpt4all-bindings/python
# pip install:
# '-e' means 'editable', so you can edit binding code here, if desired; '.' means the package to install is in this folder
# i'd strongly recommend '--user' installation, otherwise needs sudo and clobbers your system
pip3 install --user -e .  

# running the CLI
cd ../cli
pip3 install --user typer
python3 app.py repl
