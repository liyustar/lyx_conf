#!/bin/bash
# install ubuntu application

set -e

INSTALL_CMD="apt-get install -y"

$INSTALL_CMD zsh

$INSTALL_CMD git
$INSTALL_CMD vim

$INSTALL_CMD tmux

$INSTALL_CMD htop
$INSTALL_CMD iotop
$INSTALL_CMD iftop
$INSTALL_CMD iptraf
$INSTALL_CMD slurm
$INSTALL_CMD dstat
