if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

# deja overrides
export DEJA_CYCLE_KEY=^N

if [[ -d "$XDG_CONFIG_HOME/bob" ]]
then
    export BOB_CONFIG="$XDG_CONFIG_HOME/bob/config.toml"
fi

