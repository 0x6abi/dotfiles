#!/bin/sh

# default programs
export EDITOR='av'
export PAGER='less'
export MANPAGER='av +Man!'

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
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}/java"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonrc"

# zsh variables
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export HISTSIZE=5000
export SAVESIZE="${HISTSIZE:-5000}"
export SAVEHIST="${HISTSIZE:-5000}"

# pass options
export PASSWORD_STORE_CLIP_TIME="15"
export PASSWORD_STORE_GENERATED_LENGTH="32"

# add scripts to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="${CARGO_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/cargo}/bin:$PATH"
