# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Starship prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
# for low ram
# PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '

# Load mise
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"

# Machine-specific settings
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# API keys (gitignored)
[ -f ~/.apikey ] && source ~/.apikey

# fzf
command -v fzf >/dev/null 2>&1 && source <(fzf --bash)

# Bun
export BUN_INSTALL="$HOME/.bun"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

echo "loaded bashrc"
