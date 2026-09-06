# ~/.config/shell/interactive.sh

SHELL_CONFIG="${SHELL_CONFIG:-$HOME/.config/shell}"

[ -r "$SHELL_CONFIG/functions.sh" ] && . "$SHELL_CONFIG/functions.sh"

case "$(uname -s)" in
Darwin)
  [ -r "$SHELL_CONFIG/platform/darwin.sh" ] && . "$SHELL_CONFIG/platform/darwin.sh"
  ;;

Linux)
  [ -r "$SHELL_CONFIG/platform/linux.sh" ] && . "$SHELL_CONFIG/platform/linux.sh"
  ;;
esac

# interactive.sh
[ -r "$SHELL_CONFIG/tools/common.sh" ] && . "$SHELL_CONFIG/tools/common.sh"

# aliases last so they can override any other functions
[ -r "$SHELL_CONFIG/aliases.sh" ] && . "$SHELL_CONFIG/aliases.sh"
