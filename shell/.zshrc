# ~/.zshrc

SHELL_CONFIG="${SHELL_CONFIG:-$HOME/.config/shell}"

# Zsh-specific init first (OMZ, completion, tools...)
[[ -r "$SHELL_CONFIG/zsh/init.sh" ]] && source "$SHELL_CONFIG/zsh/init.sh"

# Shared interactive config last so your aliases win
[[ -r "$SHELL_CONFIG/interactive.sh" ]] && source "$SHELL_CONFIG/interactive.sh"

# Machine-local config
[ -r "$SHELL_CONFIG/local.sh" ] && source "$SHELL_CONFIG/local.sh"

# Secrets
[ -r "$HOME/.apikey" ] && source "$HOME/.apikey"
