# ~/.zshrc

# Shell behavior and history
setopt AUTO_CD APPEND_HISTORY HIST_IGNORE_DUPS SHARE_HISTORY
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Oh My Zsh plugins and completion
export ZSH="$HOME/.oh-my-zsh"
if [ -d "$ZSH" ]; then
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose kubectl)
  source "$ZSH/oh-my-zsh.sh"
else
  autoload -Uz compinit
  compinit
fi

# Shared functions and platform setup
[[ -r "$HOME/.functions" ]] && source "$HOME/.functions"
load_autojump
load_dircolors

# Optional tool integrations
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"
command -v fzf >/dev/null 2>&1 && source <(fzf --zsh)

# Machine-specific settings
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Local secrets
[ -r "$HOME/.apikey" ] && source "$HOME/.apikey"

# Aliases last so they take precedence over plugin and local definitions
[[ -r "$HOME/.aliases" ]] && source "$HOME/.aliases"
