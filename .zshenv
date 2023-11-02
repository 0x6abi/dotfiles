#!/bin/sh

# default programs
export EDITOR='nvim'
export PAGER='less'
export MANPAGER='nvim +Man!'

# xdg variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# set ssh var for systemd services
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# clean up home directory
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/config.toml"
export LESSHISTFILE=-
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export ZDOTDIR="${XDG_CONFIG_DIR:-$HOME/.config}/zsh"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"

# zsh variables
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export HISTSIZE=5000
export SAVESIZE="${HISTSIZE:-5000}"
export SAVEHIST="${HISTSIZE:-5000}"

# add scripts to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="${CARGO_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/cargo}/bin:$PATH"

# bemenu (dmenu for wayland) options
export BEMENU_OPTS="-i \
  -p run: \
  -H 30 \
  --ch 20 \
  --cw 2 \
  --hp 6 \
  --tb #dcd7ba \
  --tf #1f1f28 \
  --fb #16161d \
  --ff #c8c093 \
  --nb #1f1f28 \
  --nf #dcd7ba \
  --hb #223249 \
  --hf #dcd7ba \
  --sb #2d4f67 \
  --sf #dcd7ba \
  --ab #1f1f28 \
  --af #dcd7ba \
  --fn Iosevka Regular 20"
