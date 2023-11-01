#!/bin/sh

# default programs
export EDITOR='nvim'
export PAGER='less'
export MANPAGER='nvim +Man!'

# xdg variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

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
export PATH="${CARGO_HOME:-$HOME/.local/share/cargo}/bin:$PATH"
