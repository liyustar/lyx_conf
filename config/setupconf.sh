#!/bin/bash
# setup all config

set -e

CURDIR=$(pwd)

ln -sf $CURDIR/tmuxconf $HOME/.tmux.conf
ln -sf $CURDIR/vimrc_mac $HOME/.vimrc
ln -sf $CURDIR/gitignore $HOME/.gitignore
