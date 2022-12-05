#!/bin/bash

# install ghcup

sudo apt update && sudo apt upgrade -y
sudo apt install  build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# this script is used to install / upgrade stack for haskell in raspberry pi only
# will take a very long time to finish

# sudo apt install llvm
#
# sudo apt install clang ninja-build
#
# sudo apt install haskell-stack
#
# stack update
#
# stack upgrade
#
