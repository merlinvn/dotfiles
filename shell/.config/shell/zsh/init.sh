# ~/.config/shell/zsh/init.sh

setopt AUTO_CD
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

if [ -d "$ZSH" ]; then
  plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    docker-compose
    kubectl
  )

  source "$ZSH/oh-my-zsh.sh"
else
  autoload -Uz compinit
  compinit
fi

[[ -r "$SHELL_CONFIG/zsh/completions.zsh" ]] && source "$SHELL_CONFIG/zsh/completions.zsh"

[[ -r "$SHELL_CONFIG/tools/zsh.sh" ]] && source "$SHELL_CONFIG/tools/zsh.sh"
