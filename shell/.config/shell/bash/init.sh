# ~/.config/shell/bash/init.sh

shopt -s autocd 2>/dev/null
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

[[ -r "$SHELL_CONFIG/bash/completions.sh" ]] && source "$SHELL_CONFIG/bash/completions.sh"

# bash/init.sh
[[ -r "$SHELL_CONFIG/tools/bash.sh" ]] &&
  source "$SHELL_CONFIG/tools/bash.sh"
