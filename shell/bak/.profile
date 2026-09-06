# ~/.profile: Login shell configuration
# -------------------------------------
# Sourced for login shells

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Shared PATH (keep bash and zsh aligned)
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.local/share/mise/shims" ] && PATH="$HOME/.local/share/mise/shims:$PATH"

# Shell-specific rc files should not re-source shared PATH logic here.
