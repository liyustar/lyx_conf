#!/bin/bash

if [ ! -e $HOME/.subversion ]; then
    exit 1
fi

sed -i 's/.*editor-cmd =.*/editor-cmd = vim/' $HOME/.subversion/config
sed -i 's/.*diff-cmd =.*/diff-cmd = colordiff/' $HOME/.subversion/config
