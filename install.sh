#!/bin/sh

# pull the git repo with config files
mkdir -p ~/projects
git clone https://github.com/ninikx/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles

# install official packages
sudo pacman -Syu
sudo pacman -S $(cat pkgs.txt) --noconfirm --needed

# install AUR helper
git clone https://aur.archlinux.org/aura-bin.git ~/aura-bin
cd ~/aura-bin
makepkg
sudo pacman -U aura-*-x86_64.tar.gz
cd ~/projects/dotfiles
rm ~/aura-bin -rf

# install AUR packages
sudo aura -A $(cat pkgs_aur.txt) --noconfirm --needed

# zsh does not create directories itself, so to ensure that zsh files get stored 
# at the correct location, we'll have to manually create them

# completion
mkdir -p ~/.cache/zsh/
touch ~/.cache/zsh/compdumb

# history
mkdir -p ~/.local/share/zsh
touch ~/.local/share/zsh/history

# symlink config files
cd ~/projects && stow dotfiles && cd ~

# change shell to zsh
chsh -s /usr/bin/zsh

# install bashls through zsh to ensure correct envs are loaded
zsh -c "npm i -g bash-language-server"

# install rust toolchain including rust-analyzer, the rust lsp
zsh -c "rustup install stable"

echo "installation complete"
# clear
exec zsh
