#!/bin/bash


if [ -d "./Formula" ]; then
    rm -rf "./Formula"
fi

mkdir "./Formula"
mkdir "./temp"

virtualenv .venv
source .venv/bin/activate
pip install cephalon-interface homebrew-pypi-poet
poet -f cephalon-interface > Formula/cephalon-interface.rb
poet -s pip > temp/pip.rb
python edit.py
deactivate
rm -rf "./temp"
rm -rf "./.venv"
