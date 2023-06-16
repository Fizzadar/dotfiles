#!/bin/sh

# Init bash sensible
source ~/.dotfiles/bash-sensible/sensible.bash

# Other .dotfiles shell scripts
source ~/.dotfiles/shell_scripts/aliases.sh
source ~/.dotfiles/shell_scripts/exports.sh
source ~/.dotfiles/shell_scripts/powerline.sh
source ~/.dotfiles/shell_scripts/dotupdate.sh
source ~/.dotfiles/shell_scripts/wezterm.sh

# Bash completion scripts!
if [ $(uname -s) = "Darwin" ]; then
	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	    source $(brew --prefix)/etc/bash_completion
	fi
fi

# Include any extras
if [ -e "${HOME}/.extras" ]; then
    source ~/.extras
fi
