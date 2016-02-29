#!/bin/bash
# 安装 Mac OS X 环境的总脚本

set -e

function xecho {
  echo "[x] $1"
}

# switch zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  if [ -z "$(which zsh)" ]; then
    xecho "Error zsh not found"
    exit -1
  fi
  xecho "Need switch zsh ..."
  chsh -s $(which zsh) && xecho "Please logout and login back again"
  exit
fi


# install oh-my-zsh
if [ ! -e "$HOME/.oh-my-zsh" ]; then
  xecho "Installing oh-my-zsh ..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # 增加oh-my-zsh插件
  ZSH_PLUGINS="(autojump git brew colored-man-pages common-aliases cp tmux vi-mode wd)"
  xecho "change plugins=$ZSH_PLUGINS"
  sed -i "s/^plugins=(.*)/plugins=$ZSH_PLUGINS/" $HOME/.zshrc
  xecho "need relogin to active plugins"

  xecho "Done oh-my-zsh!"
else
  xecho "Have exists: .oh-my-zsh"
fi


# install tmux
if [ -z "$(tmux -V)" ]; then
  xecho "Installing tmux ..."
  brew install tmux
  xecho "Done tmux!"
else
  xecho "Have exists: tmux"
fi


xecho "Done!!!"