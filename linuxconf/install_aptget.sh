#!/bin/bash
# install ubuntu application

set -e

INSTALL_CMD="apt-get install"

$INSTALL_CMD git
$INSTALL_CMD vim

$INSTALL_CMD tmux

$INSTALL_CMD htop
