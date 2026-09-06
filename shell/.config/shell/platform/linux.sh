# ~/.config/shell/platform/linux.sh

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b 2>/dev/null)"
fi

alias ls='ls --color=auto'
