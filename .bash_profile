#!/bin/sh

# Init bash sensible
source ~/.dotfiles/bash-sensible/sensible.bash

# Other .dotfiles shell scripts
source ~/.dotfiles/shell_scripts/aliases
source ~/.dotfiles/shell_scripts/exports
source ~/.dotfiles/shell_scripts/powerline

source ~/.dotfiles/shell_scripts/functions/dotupdate
source ~/.dotfiles/shell_scripts/functions/nmenv
source ~/.dotfiles/shell_scripts/functions/pvagrant
source ~/.dotfiles/shell_scripts/functions/fizzenv

# Bash completion scripts!
if [ `uname -s` = "Darwin" ]; then
	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	    source $(brew --prefix)/etc/bash_completion
	fi
fi

# Include any extras
if [ -e "${HOME}/.extras" ]; then
    source ~/.extras
fi
