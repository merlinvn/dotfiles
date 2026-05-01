# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Load profile
[ -s "$HOME/.profile" ] && source "$HOME/.profile"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting docker docker-compose kubectl)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source aliases
[ -f ~/.aliases ] && source ~/.aliases

source <(fzf --zsh)

# Starship prompt
#[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"
# for low ram sbc
# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%# '

# Load mise
[ -x "$(command -v mise)" ] && eval "$(mise activate zsh)"
