#!/bin/bash
# install mac application

set -e

INSTALL_CMD="brew install"

$INSTALL_CMD tmux
$INSTALL_CMD reattach-to-user-namespace

$INSTALL_CMD htop
