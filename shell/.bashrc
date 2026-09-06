# ~/.bashrc

# Ignore non-interactive shells
[[ $- != *i* ]] && return

SHELL_CONFIG="${SHELL_CONFIG:-$HOME/.config/shell}"

[[ -r "$SHELL_CONFIG/bash/init.sh" ]] && source "$SHELL_CONFIG/bash/init.sh"

[[ -r "$SHELL_CONFIG/interactive.sh" ]] && source "$SHELL_CONFIG/interactive.sh"

[[ -r "$SHELL_CONFIG/local.sh" ]] && source "$SHELL_CONFIG/local.sh"
