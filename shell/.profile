# ~/.profile: Login shell configuration
# -------------------------------------
# Sourced for login shells

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path
[ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Load .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi
