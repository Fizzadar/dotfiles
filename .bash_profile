#!/bin/sh

# Fizzadar's .dotfiles
# File: .bash_profile
# Desc: bootstraps new bash shells


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;


# git submodule projects
source ~/.dotfiles/pvagrant/pvagrant
source ~/.dotfiles/bash-sensible/sensible.bash
source ~/.dotfiles/nmenv/nmenv


# Other .dotfiles shell scripts
source ~/.dotfiles/shell_scripts/aliases
source ~/.dotfiles/shell_scripts/exports
source ~/.dotfiles/shell_scripts/powerline
source ~/.dotfiles/shell_scripts/dotupdate
source ~/.dotfiles/shell_scripts/checks


# Bash completion scripts!
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source $(brew --prefix)/etc/bash_completion
fi


# Include any extras
if [ -e "${HOME}/.extras" ]; then
    source ~/.extras
fi
