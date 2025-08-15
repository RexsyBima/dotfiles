#!/bin/bash

# Script to install a predefined list of packages on Arch Linux using pacman
# Packages: wayvnc android-tools tmux zsh
# Also installs Oh My Zsh, custom plugins, and configures .zshrc

# Check if the script is run as root
if [[ $EUID -eq 0 ]]; then
  echo "This script should not be run as root."
  exit 1
fi
