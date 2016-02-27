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
if [ ! -e "$HOME/.oh-my-zsh" ]; then
  xecho "Installing oh-my-zsh ..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  xecho "Done oh-my-zsh!"
else
  xecho "Have exists: .oh-my-zsh"
fi

