# ~/.config/shell/path.sh

path_prepend() {
  [ -d "$1" ] || return 0

  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$1:$PATH" ;;
  esac
}

path_prepend "$HOME/.local/share/bob/nvim-bin"
path_prepend "/usr/local/go/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.fzf/bin"

path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"

export PATH

unset -f path_prepend 2>/dev/null || true
