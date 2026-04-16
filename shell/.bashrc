# ~/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source .profile for login paths
[ -f ~/.profile ] && . ~/.profile

# Source aliases
[ -f ~/.aliases ] && source ~/.aliases

# Starship prompt
has starship && eval "$(starship init bash)"
