# ~/.config/shell/aliases.sh

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
if has eza; then
  alias ls='eza --color=auto --icons --group-directories-first'
  alias ll='eza -alhF --icons --group-directories-first'
  alias la='eza -a --icons --group-directories-first'
  alias l='eza -F --icons --group-directories-first'
else
  alias ll='ls -al'
  alias la='ls -a'
  alias l='ls -F'
fi

# Common tools
has tree && alias tree='tree -C'
has less && alias less='less -R'
has bat && alias b='bat'

# Editors
has vim && alias v='vim'
has nvim && alias n='nvim'

# Git
if has git; then
  alias gd='git diff'
  alias ga='git add'
  alias gaa='git add .'
  alias gc='git commit'
  alias gcm='git commit -m'
  alias gcam='git commit -am'
  alias gp='git pull --rebase'
  alias gpsh='git push'
  alias gs='git status'
  alias gss='git status -s'
  alias gl='git log --oneline --graph --decorate'
fi

# Kubernetes
has kubectl && alias k='kubectl'

# Git TUIs
has lazygit && alias lg='lazygit'
has gitui && alias gg='gitui'

# Node
if has npm; then
  alias ni='npm install'
  alias nr='npm run'
  alias ns='npm start'
fi

# Task
has task && alias t='task'

# mise
if has mise; then
  alias x='mise exec --'
  alias r='mise run'
fi
