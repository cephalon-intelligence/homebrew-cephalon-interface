#!/bin/bash

if [ -d "./.venv" ]; then
    rm -rf "./.venv"
fi

virtualenv .venv
source .venv/bin/activate
pip install cephalon-interface homebrew-pypi-poet
poet -f cephalon-interface > Formula/cephalon-interface.rb
python fixes.py
deactivate
rm -rf "./.venv"
