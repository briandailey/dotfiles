#/usr/bin/env bash
rm ~/.bashrc ~/.psqlrc ~/.gitconfig ~/.vimrc ~/.vim ~/.tmux.conf
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/psqlrc ~/.psqlrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
