#!/bin/bash

# this script is used to install / upgrade stack for haskell in raspberry pi only
# will take a very long time to finish

sudo apt update && sudo apt upgrade -y

sudo apt install build-essential libnuma1 libnuma-dev libtinfo-dev libtinfo5 libtinfo6 libc6-dev

sudo apt install llvm

sudo apt install clang ninja-build

sudo apt install haskell-stack

stack update

stack upgrade

