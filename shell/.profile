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

if [ -d /sbin ] ; then
    PATH="/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if xhost >& /dev/null ; then
  # setxkbmap -option caps:swapescape
# fi

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.cargo/bin

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

[[ -f "/etc/arch-release" ]] && [[ $(fgconsole 2>/dev/null) == 1 ]] && startx -- vt1

[[ -f "/usr/bin/vcgencmd" ]] && alias temp="/usr/bin/vcgencmd measure_temp"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


if [[ "$OSTYPE" == "darwin"* ]]; then
  alias python=python3
  alias pip=pip3
fi

alias anaconda='source  ~/.conda.shellrc'

