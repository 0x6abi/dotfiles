#!/bin/sh

# pull the git repo with config files
git clone https://github.com/ninikx/dotfiles.git ~/.dots
cd ~/.dots

# install packages
sudo pacman -Syu
sudo pacman -S $(cat pkgs.txt) --noconfirm --needed

# install the aur helper
git clone https://aur.archlinux.org/aura-bin.git
cd ~/aura-bin
makepkg -si
cd ~/.dots
rm ~/aura-bin -rf

# install aur packages
sudo aura -A $(cat pkgs_aur.txt) --noconfirm --needed

# clone astronvim (good starter nvim config)
git clone --depth=1 https://github.com/AstroNvim/AstroNvim "~/${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# zsh does not create directories itself, so to ensure that zsh files get stored 
# at the correct location, we'll have to manually create them

# completion
mkdir -p "~/${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"

# history
mkdir -p "~/${XDG_DATA_HOME/:-$HOME/.local/share}/zsh"

# symlink config files
cd ~/.dots && stow . && cd ~

# rm bash files from $HOME
rm .bash* -rf

# change shell to zsh
chsh -s /usr/bin/zsh

clear
exec zsh
