#!/bin/bash

# update apt 
sudo apt update
sudo apt ugrade


# make tmp folder
mkdir -p ~/tmp
cd ~/tmp

# install prequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# clone
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable

# if updating, then just "git pull"

# build and install
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

#install provider
sudo apt install python3-pip
python -m pip install --upgrade pip
python3 -m pip install --user --upgrade pynvim
npm install -g neovim

# run
nvim
