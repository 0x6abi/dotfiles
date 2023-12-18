#!/bin/sh

# default programs
export EDITOR='helix'
export PAGER='less'

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

# zsh variables
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export HISTSIZE=5000
export SAVESIZE="${HISTSIZE:-5000}"
export SAVEHIST="${HISTSIZE:-5000}"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# add scripts to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:${CARGO_HOME:-$HOME/.local/share/cargo}/bin"
export PATH="$PATH:${XDG_DATA_HOME:-$HOME/.local/share}/npm/bin"

# use tty for gpg auth
export GPG_TTY=$(tty)
