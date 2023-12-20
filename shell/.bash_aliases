function set_alias() {
	local cmd=$1
	local tool=$2
	shift 2

	if [ -x "$(command -v $tool)" ]; then
		alias $cmd="$tool $*"
	fi
}

# unameOut="$(uname -s)"
# case "${unameOut}" in
#     Linux*)     machine=Linux;;
#     Darwin*)    machine=Mac;;
#     CYGWIN*)    machine=Cygwin;;
#     MINGW*)     machine=MinGw;;
#     *)          machine="UNKNOWN:${unameOut}"
# esac

if [[ -x "$(command -v exa)" ]]; then
  set_alias ls exa --color=auto
  set_alias ll exa -alhF
  set_alias la exa -a
  set_alias l exa -F
else
  set_alias ll ls -al
  set_alias la ls -a
  set_alias l ls -F
fi

alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'

# Git aliases.
if [[ -f "$HOME/forgit/forgit.plugin.zsh" ]]; then

else
	alias gd='git diff'
	alias ga='git add'
fi

if [[ -x "$(command -v git)" ]]; then
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
fi

set_alias lg lazygit
set_alias gg gitui

# npm aliases
if [[ -x "$(command -v npm)" ]]; then
	alias ni="npm install"
	alias nr="npm run"
	alias ns="npm start"
fi

set_alias bat batcat
set_alias cat batcat
set_alias catr batcat -p

set_alias br broot
set_alias find fd

# set_alias top htop
# set_alias top bpytop

# kubernetes
set_alias k kubectl

# cheat.sh
if [[ -x "$(command -v cht.sh)" ]]; then
	alias c='cht.sh'
else
	c() {
		curl cht.sh/$1
	}
fi

set_alias m micro
set_alias v nvim
set_alias vi nvim

alias tmux="TERM=screen-256color tmux"

[[ -f "/usr/bin/vcgencmd" ]] && alias temp="/usr/bin/vcgencmd measure_temp"

alias luamake=$HOME/lua-language-server/3rd/luamake/luamake

# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias anaconda='source  ~/.conda.shellrc'

set_alias gt go-task
set_alias t go-task

if [[ -x "$(command -v yay)" ]]; then
	alias yayi="yay -Slq | fzf --multi --preview 'if yay -Qi {1} &> /dev/null; then echo -e \"Installed package information:\n\n\"; yay -Qi {1}; else echo -e \"Package information:\n\n\"; yay -Si {1}; fi || echo No information found.' | xargs -ro yay -S"
	alias yayrm="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro sudo yay -Rns"
fi

if [[ -x "$(command -v paru)" ]]; then
	alias parui="paru -Slq | fzf --multi --preview 'if paru -Qi {1} &> /dev/null; then echo -e \"Installed package information:\n\n\"; paru -Qi {1}; else echo -e \"Package information:\n\n\"; paru -Si {1}; fi || echo No information found.' | xargs -ro paru -S"
	alias parurm="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro sudo paru -Rns"
fi

set_alias jr zellij r --
set_alias je zellij edit
set_alias jj zellij

alias python='python3'
alias pip='pip3'

alias rma="perl -e 'for(<*>){((stat)[9]<(unlink))}' &"

if [[ -x "$(command -v gh)" ]]; then
	alias '??'='gh copilot suggest -t shell'
	alias 'git?'='gh copilot suggest -t git'
	alias 'gh?'='gh copilot suggest -t gh'
fi
