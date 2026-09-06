# ~/.profile

SHELL_CONFIG="$HOME/.config/shell"

[ -r "$SHELL_CONFIG/env.sh" ] && . "$SHELL_CONFIG/env.sh"

[ -r "$SHELL_CONFIG/path.sh" ] && . "$SHELL_CONFIG/path.sh"
