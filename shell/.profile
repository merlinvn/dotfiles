# ~/.profile: Login shell configuration
# -------------------------------------
# This file is sourced for login shells. For interactive shells, use .bashrc or .zshrc.
# Default umask settings and examples can be found in /usr/share/doc/bash/examples/startup-files.

# Localization and Input Method Configuration
# -------------------------------------
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus

# Locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Shell-Specific Sourcing
# -------------------------------------
# Include .bashrc if available and running bash
if [ -n "$BASH_VERSION" ]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# PATH Configuration
# -------------------------------------
# System paths
[ -d /sbin ] && PATH="/sbin:$PATH"
[ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:$PATH"

# User and Local Paths
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# Additional Paths for Installed Tools
# Bun (JavaScript runtime)
export BUN_INSTALL="$HOME/.bun"
[[ -d $BUN_INSTALL ]] && export PATH="$BUN_INSTALL/bin:$PATH"

# Volta (JavaScript tool manager)
if [ -d "$HOME/.volta" ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# Yarn global binaries
[ -x "$(command -v yarn)" ] && export PATH="$(yarn global bin):$PATH"

# Neovim
[[ -d "$HOME/.local/share/bob/nvim-bin" ]] && export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
[[ -x "$(command -v nvim)" ]] && export EDITOR="nvim"

# vcpkg (C++ package manager)
export VCPKG_ROOT=~/vcpkg
export PATH=$VCPKG_ROOT:$PATH

# Meteor (JavaScript platform)
export PATH=/Users/neo/.meteor:$PATH

# Compiler and Language Toolchain Configuration
# -------------------------------------
# Rust: sccache for caching compiled artifacts
[[ -x "$(command -v sccache)" ]] && export RUSTC_WRAPPER="sccache"

# Go: Module and Path configuration
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
[ -d "/usr/local/go/bin" ] && export PATH=$PATH:/usr/local/go/bin

# GCC 10.2.0 setup for C/C++ compilation
if [ -d "/usr/local/gcc-10.2.0" ]; then
  export PATH=/usr/local/gcc-10.2.0/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/gcc-10.2.0/lib64:$LD_LIBRARY_PATH
  alias gcc=gcc-10.2
  alias g++=g++-10.2
fi

# LLVM (uncomment if using LLVM)
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# JupyterLab directory configuration
export JUPYTERLAB_DIR="$HOME/.local/share/jupyter/lab"

# RVM (Ruby Version Manager) for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Conditionally Load Tools
# -------------------------------------
# Podman Docker host setup (rootless)
[[ -f "/usr/bin/podman" ]] && export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

# Cargo (Rust package manager)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

# rbenv for Ruby environment management
[ -f "/usr/bin/rbenv" ] && eval "$(rbenv init -)"

# CUDA Environment Configuration
# -------------------------------------
# Primary CUDA setup
if [ -d "/usr/local/cuda" ]; then
  export PATH="/usr/local/cuda/bin:$PATH"
  export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
fi

# Alternate CUDA Path (for version 12.2)
if [ -d "/usr/local/cuda-12.2/bin" ]; then
  export PATH="/usr/local/cuda-12.2/bin:${PATH}"
  export LD_LIBRARY_PATH="/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
fi

# Miscellaneous Configurations
# -------------------------------------
# Set Caps Lock as Escape (requires xhost)
if xhost >&/dev/null; then
  setxkbmap -option caps:escape
fi

# Uncomment to set the terminal type (TERM) if necessary
# export TERM="xterm-256color"
# export TERM="tmux-256color"
# export TERM="screen-256color"
# export TERM="xterm"

# Uncomment to auto-start X11 if needed
# [[ -f "/etc/arch-release" ]] && [[ $(fgconsole 2>/dev/null) == 1 ]] && startx -- vt1

# Uncomment for macOS-specific Python setup
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   alias python=python3
#   alias pip=pip3
#   export PATH=$HOME/Library/Python/3.10/bin:$PATH
# fi

# Uncomment to set a custom key binding for Tmux sessionizer
# bindkey -s ^f "tmux-sessionizer\n"
