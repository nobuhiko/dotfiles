#!/bin/bash
ln -sb $HOME/dotfiles/_bashrc $HOME/.bashrc
ln -sb $HOME/dotfiles/_vimrc $HOME/.vimrc
ln -sb $HOME/dotfiles/vimfiles $HOME/.vim
ln -sb $HOME/dotfiles/_gitconfig $HOME/.gitconfig
ln -sb $HOME/dotfiles/_gitignore $HOME/.gitignore
source $HOME/.bashrc
