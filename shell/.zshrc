# zmodload zsh/zprof
# export TERM="xterm-256color" # This sets up colors properly
# export TERM="tmux-256color" # This sets up colors properly
# export TERM="screen-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export NVM_LAZY=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-autosuggestions docker docker-compose kubectl zsh-syntax-highlighting npm zsh-completions)

autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

function mkcd {
  command mkdir $1 && cd $1
}

function dipa(){
  docker rm -v $(docker ps -a -q -f status=exited);
  docker volume rm $(docker volume ls -qf dangling=true);
  docker rmi $(docker images -qf dangling=true);
}

[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.zsh ] &&  source /usr/share/autojump/autojump.zsh

function _fix_cursor() {
  echo -ne '\e[6 q'
}

precmd_functions+=(_fix_cursor)

[ -x /usr/local/bin/kubectl ] && source <(kubectl completion zsh)

[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

[ -x "$(command -v yarn)" ] && export PATH="$(yarn global bin):$PATH"

unsetopt BEEP

fpath+=${ZDOTDIR:-~}/.zsh_functions

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


## this is the replacement for j with fzf support
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"

[ -f "$HOME/forgit/forgit.plugin.zsh" ] && source "$HOME/forgit/forgit.plugin.zsh"

# Add exports from your profile
[ -s "$HOME/.profile" ] && source "$HOME/.profile"

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/my_env ] && source ~/my_env

# [ -x "$(command -v cowsay)" -a -x "$(command -v fortune)" ] && fortune | cowsay
# [ -x "$(command -v neofetch)" ] && neofetch
# [ -x "$(command -v cowsay)" ] && cowsay -f small "Hello Neo\!"

[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"
[ -x "$(command -v rtx)" ] && eval "$(rtx activate zsh)"


# nvim selector
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^n "nvims\n"

# Add any commands which depend on conda here
lazy_conda_aliases=('conda')

function load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases
  do
    unalias $lazy_conda_alias
  done

  __conda_prefix="$HOME/.miniconda3" # Set your conda Location


# >>> conda initialize >>>
  __conda_setup="$('/home/neo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/neo/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/neo/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/neo/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
# <<< conda initialize <<<

  unset __conda_prefix
  unfunction load_conda
}

for lazy_conda_alias in $lazy_conda_aliases
do
    alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done

