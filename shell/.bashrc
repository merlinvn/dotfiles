# ~/.bashrc

# Skip setup for non-interactive shells
[[ $- != *i* ]] && return

# Shell behavior and history
shopt -s autocd histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# Shared functions and platform setup
[[ -r "$HOME/.functions" ]] && source "$HOME/.functions"
load_autojump
load_dircolors

# Optional tool integrations
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

# Machine-specific settings
[[ -r "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"

# Local secrets
[ -r "$HOME/.apikey" ] && source "$HOME/.apikey"

# Aliases last so they take precedence over integration and local definitions
[[ -r "$HOME/.aliases" ]] && source "$HOME/.aliases"
