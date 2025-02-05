function fish_user_key_bindings
    # echo "Loading fish_user_key_bindings"
    fzf --fish | source
    bind --erase \cr # Remove fzf's Ctrl+R to use Fish's native binding
end
