#!/bin/sh

# Fizzadar's .dotfiles
# File: .bash_profile
# Desc: bootstraps new bash shells


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;


# git submodule projects
source ~/.dotfiles/venv/venv
source ~/.dotfiles/proj/proj
source ~/.dotfiles/bash-sensible/sensible.bash


# Other .dotfiles shell scripts
source ~/.dotfiles/shell_scripts/aliases
source ~/.dotfiles/shell_scripts/exports
source ~/.dotfiles/shell_scripts/powerline
source ~/.dotfiles/shell_scripts/dotupdate
source ~/.dotfiles/shell_scripts/checks


# Bash completion scripts!
bashdir="$(brew --prefix)/etc/bash_completion.d"
if [ -d "${bashdir}" ]; then
    for f in $bashdir/*; do
        source $f
    done
    unset f
fi
unset bashdir


# Include any extras
if [ -e "${HOME}/.extras" ]; then
    source ~/.extras
fi
