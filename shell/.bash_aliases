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
if [[ -f "$HOME/forgit/forgit.plugin.zsh" ]] ; then

else
  alias gd='git diff'
  alias ga='git add'
fi

alias gi='git init'
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
[ -x "$(command -v lazygit)" ] && alias lg='lazygit'
[ -x "$(command -v gitui)" ] && alias gg='gitui'


# npm aliases
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"


# [ -x "$(command -v bat)" ] && alias cat='bat'
# [ -x "$(command -v bat)" ] && alias catr='bat -p'
# [ -x "$(command -v batcat)" ] && alias cat='batcat'

# [ -x "$(command -v fd)" ] && alias find='fd'
# [ -x "$(command -v fdfind)" ] && alias fd='fdfind'

# [ -x "$(command -v htop)" ] && alias top='htop'
# [ -x "$(command -v bpytop)" ] && alias top='bpytop'

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
  alias nv="nvim"
  # alias nv="neovide"
  #alias vi="nvim"
  # alias oldvim="\vim"
fi

[[ -f "/usr/bin/vcgencmd" ]] && alias temp="/usr/bin/vcgencmd measure_temp"

alias luamake=$HOME/lua-language-server/3rd/luamake/luamake
alias tmux="TERM=screen-256color tmux"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias anaconda='source  ~/.conda.shellrc'

[ -x "$(command -v go-task)" ] && alias gt="go-task"
[ -x "$(command -v go-task)" ] && alias t="go-task"

alias parui="paru -Slq | fzf --multi --preview 'if paru -Qi {1} &> /dev/null; then echo -e \"Installed package information:\n\n\"; paru -Qi {1}; else echo -e \"Package information:\n\n\"; paru -Si {1}; fi || echo No information found.' | xargs -ro paru -S"
alias parurm="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro sudo paru -Rns"

[ -x "$(command -v zellij)" ] && alias jr="zellij r --"
[ -x "$(command -v zellij)" ] && alias je="zellij edit "
[ -x "$(command -v zellij)" ] && alias jj="zellij"

