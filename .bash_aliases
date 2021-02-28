if [[ -f ~/.cargo/bin/exa ]] || [[ -f /usr/bin/exa ]]; then
  alias ls='exa --color=auto'
  alias ll='exa -alhF'
  alias la='exa -a'
  alias l='exa -F'
else
  alias ls='ls --color'
  alias ll='ls -alhF'
  alias la='ls -A'
  alias l='ls -F'
fi

if [[ -f ~/.cargo/bin/rg ]] || [[ -f /usr/bin/rg ]]; then
  alias grep='rg'
fi

if [[ -f ~/.cargo/bin/bat ]] || [[ -f /usr/bin/bat ]]; then
  alias cat='bat'
fi

if [[ -f /usr/bin/batcat ]]; then
  alias cat='batcat'
fi


if [[ -f ~/.cargo/bin/fd ]] || [[ -f /usr/bin/fd ]]; then
  alias find='fd'
fi

alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'

# Git aliases.
alias gd='git diff'
alias gi='git init'

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gp='git pull --rebase'
alias gpsh='git push'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gss='git status -s'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'


# npm aliases
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"


# kubernetes
[ -x "$(command -v kubectl)" ] && alias k='kubectl'

# cheat.sh
[ -x "$(command -v cht.sh)" ] && alias c='cht.sh'


# micro editor
[ -x "$(command -v micro)" ] && alias m='micro'

if [ -f "/usr/bin/nvim" -a ! -f "/usr/bin/vi" ]; then
  alias vi="nvim"
  #alias vi="nvim"
  # alias oldvim="\vim"
fi

[ -x "$(command -v fdfind)" ] && alias fd='fdfind'

