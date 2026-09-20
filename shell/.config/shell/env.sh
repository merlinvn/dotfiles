# ~/.config/shell/env.sh

export LANG="${LANG:-en_US.UTF-8}"

export PAGER="${PAGER:-less}"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export TERM=xterm-256color
export GOBIN="${GOBIN:-$HOME/.local/bin}"

if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi
