#!/bin/bash

# Script to install a predefined list of packages on Arch Linux using pacman
# Packages: wayvnc android-tools tmux zsh
# Also installs Oh My Zsh, custom plugins, and configures .zshrc

# Check if the script is run as root
if [[ $EUID -eq 0 ]]; then
  echo "This script should not be run as root."
  exit 1
fi

# Update the package database
echo "Updating package database..."
sudo pacman -Sy

# List of packages to install
packages=(
  "wayvnc"
  "android-tools"
  "tmux"
  "zsh"
)

# Install packages
echo "Installing packages..."
sudo pacman -S --needed --noconfirm "${packages[@]}"

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Oh My Zsh plugins
echo "Installing Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure .zshrc plugins
echo "Configuring .zshrc plugins..."
sed -i 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo "Installation and configuration complete."

# install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

chsh -s $(which zsh)
