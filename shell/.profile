# ~/.profile

# Environment
export LANG="${LANG:-en_US.UTF-8}"
export PAGER="${PAGER:-less}"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export TERM=xterm-256color
export GOBIN="${GOBIN:-$HOME/.local/bin}"
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border'

# Homebrew environment on macOS
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# JetBrains Toolbox commands on macOS
toolbox="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
if [ -d "$toolbox" ]; then
  case ":$PATH:" in
    *":$toolbox:"*) ;;
    *) PATH="$PATH:$toolbox" ;;
  esac
fi
unset toolbox

if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
fi

# PATH
path_prepend() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_prepend "$HOME/.local/share/bob/nvim-bin"
path_prepend /usr/local/go/bin
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.fzf/bin"
path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"
export PATH
unset -f path_prepend 2>/dev/null || true
