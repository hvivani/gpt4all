# running the CLI
cd ~/gpt4all/gpt4all-bindings/python
pip3 install --user -e .
cd ../cli
pip3 install --user typer
python3 app.py repl
