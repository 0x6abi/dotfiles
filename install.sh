#!/bin/sh

# pull the git repo with config files
git clone https://github.com/ninikx/dotfiles.git ~/.dots
cd ~/dotfiles

# install terra (repo which ships some pkgs i need)
sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo

# install  packages
sudo dnf upgrade
sudo dnf install $(cat pkgs.txt) -y

# clone astronvim
git clone --depth=1 https://github.com/AstroNvim/AstroNvim "~/${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# clone zap (zsh plugin manager)
git clone --depth=1 https://zap-zsh/zap "~/${XDG_DATA_HOME:-$HOME/.local/share}/zap" -b release-v1

# zsh does not create directories itself, so to ensure that zsh files get stored 
# at the correct location, we'll have to manually create them

# completion
mkdir -p "~/${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
touch "~/${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdumb"

# history
mkdir -p "~/${XDG_DATA_HOME/:-$HOME/.local/share}/zsh"
touch "~/${XDG_DATA_HOME/:-$HOME/.local/share}/zsh/history"

# symlink config files
cd ~/.dots && stow . && cd ~

# rm bash files from $HOME
rm .bash* -rf

# change shell to zsh
chsh -s /usr/bin/zsh

clear
exec zsh
