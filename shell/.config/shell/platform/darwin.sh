# ~/.config/shell/platform/darwin.sh

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# BSD ls color fallback
if ! command -v eza >/dev/null 2>&1; then
  alias ls='ls -G'
fi

# macOS default soft limit can be only 256
if [ "$(ulimit -n)" -lt 4096 ]; then
  ulimit -n 4096 2>/dev/null || true
fi

[ -f "$(brew --prefix)/etc/profile.d/autojump.sh" ] && source "$(brew --prefix)/etc/profile.d/autojump.sh"

# JetBrains Toolbox
TOOLBOX_BIN="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

if [ -d "$TOOLBOX_BIN" ]; then
  case ":$PATH:" in
  *":$TOOLBOX_BIN:"*) ;;
  *) PATH="$PATH:$TOOLBOX_BIN" ;;
  esac
fi

export PATH
unset TOOLBOX_BIN
