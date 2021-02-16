#!/bin/bash

#install rust
curl https://sh.rustup.rs -sSf | sh

cargo install exa -j4
cargo install ripgrep -j4
cargo install bat -j4
cargo install fd-find -j4
cargo install tokei -j4
cargo install procs -j4
