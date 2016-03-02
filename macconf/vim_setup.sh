#!/bin/bash
# setup vim

set -e

function xecho {
  echo "[x] $1"
}

# install Vundle
VUNDLE_PATH=$HOME/.vim/bundle/Vundle.vim
if [ ! -d "$VUNDLE_PATH" ]; then
    xecho "install vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    xecho "exist Vundle"
fi
