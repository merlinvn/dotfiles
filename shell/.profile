# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# those 3 variables were used by ibus
GTK_IM_MODULE=ibus
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

[ -d /sbin ] && PATH="/sbin:$PATH"
[ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

if xhost >&/dev/null; then
	setxkbmap -option caps:escape
fi

# GO setting
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -d "/usr/local/go/bin" ] && export PATH=$PATH:/usr/local/go/bin

# GCC 10.2.0
if [ -d "/usr/local/gcc-10.2.0" ]; then
	export PATH=/usr/local/gcc-10.2.0/bin:$PATH
	export LD_LIBRARY_PATH=/usr/local/gcc-10.2.0/lib64:$LD_LIBRARY_PATH
	alias gcc=gcc-10.2
	alias g++=g++-10.2
fi

if [ -f "/usr/bin/rbenv" ]; then
	eval "$(rbenv init -)"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Auto startx
#[[ -f "/etc/arch-release" ]] && [[ $(fgconsole 2>/dev/null) == 1 ]] && startx -- vt1

# if [[ "$OSTYPE" == "darwin"* ]]; then
#   alias python=python3
#   alias pip=pip3
#   export PATH=$HOME/Library/Python/3.10/bin:$PATH
# fi

if [ -d "$HOME/.volta" ]; then
	export VOLTA_HOME="$HOME/.volta"
	export PATH="$VOLTA_HOME/bin:$PATH"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
[[ -d $BUN_INSTALL ]] && export PATH="$BUN_INSTALL/bin:$PATH"

# root less podman
[[ -f "/usr/bin/podman" ]] && export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

[[ -x "$(command -v sccache)" ]] && export RUSTC_WRAPPER="sccache"
export JUPYTERLAB_DIR="$HOME/.local/share/jupyter/lab"

[[ -d "$HOME/.local/share/bob/nvim-bin" ]] && export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

[[ -x "$(command -v nvim)" ]] && export EDITOR="nvim"

# Set up CUDA environment
if [ -d "/usr/local/cuda" ]; then
    export PATH="/usr/local/cuda/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
fi


# bindkey -s ^f "tmux-sessionizer\n"
