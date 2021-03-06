#!/bin/bash

EXCDIR=`pwd`
SCRIPT=script
PKG_PATH=$HOME/Downloads
PRO_FILE=$HOME/.bashrc
HOME_BIN=home_bin
PROFILE=$HOME/.bashrc

echo $EXCDIR

# git
. $SCRIPT/gitconf.sh

# vimrc
ln -sf -T $EXCDIR/config/vimrc_v2 $HOME/.vimrc

# home_bin
# echo "export PATH=\$PATH:$EXCDIR/$HOME_BIN # HOME_BIN_SET" >> $PROFILE && \
# source $PROFILE

# jdk
# $SCRIPT/install_jdk.sh $HOME/Tool $PKG_PATH/jdk-7u22-linux-x64.gz $HOME/.bashrc

# redis
# $SCRIPT/install_redis.sh $HOME/Tool $PKG_PATH/redis-2.8.17.tar.gz $HOME/.bashrc

# hbase
# $SCRIPT/install_hbase.sh $HOME/Tool $PKG_PATH/hbase-1.0.0-bin.tar.gz $HOME/.bashrc
