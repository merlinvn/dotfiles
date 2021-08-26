#!/bin/bash

rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -f ~/.profile
rm -f ~/.bash_aliases
rm -rf ~/.xinitrc
stow shell

rm -rf ~/.config/alacritty
stow alacrity

# rm -rf ~/.stalonetrayrc
# stowstanlonetrayrc

rm -f ~/.config/starship.toml
stow starship

rm -rf ~/.gitconfig
stow git

rm -rf ~/.config/i3
stow i3

rm -rf ~/.xmonad
# stow xmonad

rm -rf ~/.config/xmobar
# stow xmobar

rm -rf ~/.config/rofi
# stow rofi

rm -rf ~/.config/picom
stow picom

rm -rf ~/.config/dunst
stow dunst

rm -rf ~/.config/betterlockscreenrc
# stow betterlockscreenrc

rm -rf ~/.config/polybar
# stow polybar

rm -rf ~/.config/leftwm
# stow leftwm

rm -f ~/.vimrc
rm -rf ~/.vim
stow vim

rm -rf ~/.config/nvim
stow nvim

rm -f ~/viminfo
touch ~/viminfo
chmod 700 ~/viminfo
