#!/bin/bash
rm -f ~/.gitconfig
rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.bash_aliases
rm -f ~/.profile
rm -f ~/.config/nvim/init.vim
rm -f ~/.xmonad/xmonad.hs
rm -f ~/.config/xmobar/xmobarrc

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.profile ~/.profile

mkdir -p ~/.xmonad
ln -s ~/dotfiles/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs

mkdir -p ~/.config/xmobar
ln -s ~/dotfiles/.config/xmobar/xmobarrc ~/.config/xmobar/xmobarrc


mkdir -p ~/.vim/plugin
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# link setting
for f in `find ./vim_config -regex ".*\.vim$\|.*\.lua$"`; do
  rm -rf ~/.vim/${f:13}
  rm -rf ~/.config/nvim/${f:13}

  ln -s ~/dotfiles/${f:2} ~/.vim/${f:13}
  ln -s ~/dotfiles/${f:2} ~/.config/nvim/${f:13}
done


# link Starship settings
rm -f ~/.config/starship.toml
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

rm -f ~/viminfo
touch ~/viminfo
chmod 700 ~/viminfo
