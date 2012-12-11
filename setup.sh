#!/bin/bash
mv $HOME/.bashrc $HOME/bashrcbk
mv $HOME/.vimrc $HOME/vimrcbk
mv $HOME/.gitconfig $HOME/gitconfigbk
mv $HOME/.gitignore $HOME/gitignoregbk
ln -s $HOME/dotfiles/_bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/vimfiles $HOME/.vim
ln -s $HOME/dotfiles/_gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/_gitignore $HOME/.gitignore
