##source:
##https://github.com/nomic-ai/gpt4all/issues/682


#git clone --recurse-submodules https://github.com/nomic-ai/gpt4all
git clone --recurse-submodules https://github.com/hvivani/gpt4all.git
# following the instructions here: https://github.com/nomic-ai/gpt4all/tree/main/gpt4all-bindings/python#local-build-instructions
cd gpt4all/gpt4all-backend
mkdir build && cd build
cmake ..
cmake --build . --parallel
ls *.so  # should print 'libllmodel.so'

# python bindings:
cd ../../gpt4all-bindings/python
# pip install:
# '-e' means 'editable', so you can edit binding code here, if desired; '.' means the package to install is in this folder
# i'd strongly recommend '--user' installation, otherwise needs sudo and clobbers your system
pip3 install --user -e .  

# running the CLI
cd ../cli
pip3 install --user typer
python3 app.py repl
