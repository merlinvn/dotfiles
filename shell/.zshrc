# Shell Setup
# ----------------------

# Uncomment to enable zsh profiling (for debugging)
zmodload zsh/zprof

# Load shell and path
export SHELL=$(which zsh)

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Load general profile exports
[ -s "$HOME/.profile" ] && source "$HOME/.profile"

# Disable bell
unsetopt BEEP

# Oh-My-Zsh Setup
# ----------------------

# Settings to improve interactivity and performance
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load Oh-My-Zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete autojump docker docker-compose kubectl npm)
source $ZSH/oh-my-zsh.sh

# Add custom function paths
fpath+=~/.zfunc
fpath+=${ZDOTDIR:-~}/.zsh_functions

# load compinit once
# autoload -Uz compinit && compinit -C -u
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Load additional tool integrations and completions
# ----------------------

# Autojump paths
[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.zsh ] && source /usr/share/autojump/autojump.zsh
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Fix cursor on some terminals
function _fix_cursor() { echo -ne '\e[6 q'; }
precmd_functions+=(_fix_cursor)

# Starship prompt setup
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

# fzf (fuzzy finder) configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Kubectl completion
[ -x /usr/local/bin/kubectl ] && source <(kubectl completion zsh)

# GHCup environment
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Replacement for `j` with fzf support (zoxide)
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"

# Forgit plugin
[ -f "$HOME/forgit/forgit.plugin.zsh" ] && source "$HOME/forgit/forgit.plugin.zsh"

# eza completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Aliases and Environment-Specific Configurations
# ----------------------

# Custom shell aliases and environment files
[ -f ~/.shell_aliases ] && source ~/.shell_aliases
[ -f ~/my_env ] && source ~/my_env

# Additional tool configuration
[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

# Toolchain-specific initialization (rtx and mise)
[ -x "$(command -v rtx)" ] && eval "$(rtx activate zsh)"
[ -x "$(command -v mise)" ] && eval "$(mise activate zsh)"

# Conda lazy loading setup
# ----------------------

# Define lazy-loaded aliases and function to initialize Conda on demand
lazy_conda_aliases=('conda')
function load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases; do
    unalias $lazy_conda_alias
  done

  __conda_prefix="$HOME/.miniconda3"  # Set your conda Location

  # >>> Conda initialize >>>
  __conda_setup="$('/home/neo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
          . "$HOME/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="$HOME/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< Conda initialize <<<

  unset __conda_prefix
  unfunction load_conda
}

# Apply lazy-loaded alias for Conda
for lazy_conda_alias in $lazy_conda_aliases; do
    alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done

# Optional Features and Appearance
# ----------------------

# Disable software flow control (uncomment to use Ctrl-S and Ctrl-Q normally)
# stty -ixon

# Run neofetch if available (system information tool)
[ -x "$(command -v neofetch)" ] && neofetch

# Opam configuration (for OCaml package management)
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null

# Fabric bootstrap configuration
if [ -f "$HOME/.config/fabric/fabric-bootstrap.inc" ]; then
  . "$HOME/.config/fabric/fabric-bootstrap.inc"
fi

export PATH=$PATH:$HOME/.maestro/bin
