#!/bin/zsh
### options/settings ###

# history settings
setopt hist_reduce_blanks hist_ignore_dups inc_append_history share_history

# enable comments
setopt interactivecomments

# colors
autoload -Uz colors && colors

# disable rm * warning
setopt rmstarsilent

# completion
setopt no_beep extended_glob glob_dots aliases correct complete_in_word

# initialize completion
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdumb"
zmodload zsh/complist

# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# vim mode
bindkey -v
export KEYTIMEOUT=1

# cursor shapes for vim modes
cursor_block='\e[1 q'
cursor_beam='\e[5 q'

function zle-keymap-select {
	case "$KEYMAP" in
		vicmd) echo -ne "$cursor_block" ;;
		viins|main) echo -ne "$cursor_beam" ;;
	esac
}
zle -N zle-keymap-select

# set terminal title to cwd
function precmd {
	print -Pn '\e]0;%~\a'
}

# set terminal title to current command
function preexec {
	print -Pn "\e]0;$1\a"
	echo -ne "$cursor_beam"
}

# reset cursor shape
function zle-line-init {
	echo -ne "$cursor_beam"
}

zle -N zle-line-init

# vim keys in completion menu
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

# disable <c-s> and <c-q>
stty stop undef
stty start undef

### plugins ###
plugin_dir='/usr/share/zsh/plugins'
source "$plugin_dir/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$plugin_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$plugin_dir/zsh-autopair/autopair.zsh"
source '/usr/share/fzf/completion.zsh'
source '/usr/share/fzf/key-bindings.zsh'
source "${XDG_CONFIG_HOME:-$HOME/.config}/aliases.sh"

# does not work for some reason in .zshenv; probably gets overwritten by the plugin
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# set correct gpg pinentry
export GPG_TTY=$(tty)

# start ssh-agent if in wayland session
if [[ ${+WAYLAND_DISPLAY} ]]; then
	eval "$(keychain --absolute --dir "$XDG_RUNTIME_DIR"/keychain -q --eval id_ed25519)"
fi

# starship prompt
eval "$(starship init zsh)"

# zoxide (fuzzy cd)
eval "$(zoxide init zsh)"
