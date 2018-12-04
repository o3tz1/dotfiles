#!/bin/bash

echo "Installing necessary apt-packages (build-essential, cmake & python3-dev)..."
sudo apt install build-essential cmake python3-dev

echo "Changing to YCM install folder (~/.vim/bundle/YouCompleteMe)..."
cd ~/.vim/bundle/YouCompleteMe/

echo "Installing YCM..."
python3 ./install.py

echo "All done, exiting..."
