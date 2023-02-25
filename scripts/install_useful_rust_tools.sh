#!/bin/bash

cargo install cargo-binstall

#using apt
# sudo apt install exa ripgrep bat fd-find fortune cowsay
cargo binstall sccache


### cli tools
cargo binstall exa
cargo binstall ripgrep
cargo binstall bat
cargo binstall fd-find
cargo binstall tokei
cargo binstall zellij
cargo binstall du-dust
cargo binstall mprocs
cargo binstall bob-nvim
cargo binstall gitui
cargo binstall procs


### dev tools
cargo binstall irust
cargo binstall evcxr_jupyter
cargo binstall bacon
cargo binstall cargo-info

### apps
cargo binstall speedtest-rs
cargo binstall broot
cargo binstall zoxide
cargo binstall wiki-tui
cargo binstall tldr
cargo binstall rtx-cli
