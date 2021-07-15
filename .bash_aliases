unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ -x "$(command -v exa)" ]] ; then
  alias ls='exa --color=auto'
  alias ll='exa -alhF'
  alias la='exa -a'
  alias l='exa -F'
else
  if [[ "${machine}" == "Linux" ]]; then
    alias ls='ls --color'
    alias ll='ls -alhF'
    alias la='ls -A'
    alias l='ls -F'
  fi
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


[ -x "$(command -v rg)" ] && alias grep='rg'

[ -x "$(command -v bat)" ] && alias cat='bat'
[ -x "$(command -v batcat)" ] && alias cat='batcat'

[ -x "$(command -v fd)" ] && alias find='fd'
[ -x "$(command -v fdfind)" ] && alias fd='fdfind'

[ -x "$(command -v htop)" ] && alias top='htop'
[ -x "$(command -v bpytop)" ] && alias top='bpytop'

# kubernetes
[ -x "$(command -v kubectl)" ] && alias k='kubectl'

# cheat.sh
if [[ -x "$(command -v cht.sh)" ]]; then
  alias c='cht.sh'
else
  c(){
    curl cht.sh/$1
  }
fi

# micro editor
[ -x "$(command -v micro)" ] && alias m='micro'

if [[ -x "$(command -v nvim)" ]]; then
  alias vi="nvim"
  #alias vi="nvim"
  # alias oldvim="\vim"
fi


