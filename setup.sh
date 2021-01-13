#!/bin/bash
rm -f ~/.gitconfig
rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.bash_aliases

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases

mkdir -p ~/.vim/plugin

# link setting
for f in `find .vim/ -regex ".*\.vim$\|.*\.lua$"`; do
  rm -rf ~/$f
  ln -s ~/dotfiles/$f ~/$f
done
