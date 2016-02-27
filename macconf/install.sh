#!/bin/bash

function xecho {
  echo "[x] $1"
}

# switch zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  xecho "Need switch zsh ..."
  chsh -s $(which zsh) && xecho "Please logout and login back again"
  exit
fi

# install oh-my-zsh

