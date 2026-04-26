# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source shared profile
[ -f "$HOME/.profile" ] && source "$HOME/.profile"

# Source aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Starship prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"

# Load mise
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"

# fzf
command -v fzf >/dev/null 2>&1 && source <(fzf --bash)

# Bun
export BUN_INSTALL="$HOME/.bun"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# OpenClaw Completion
[ -f "$HOME/.openclaw/completions/openclaw.bash" ] && source "$HOME/.openclaw/completions/openclaw.bash"
