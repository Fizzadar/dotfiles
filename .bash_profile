#!/bin/sh

# Fizzadar's .dotfiles
# File: .bash_profile
# Desc: bootstraps new bash shells


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;


# venv/proj git projects
source ~/.dotfiles/venv/venv
source ~/.dotfiles/proj/proj


# Other .dotfiles scripts
source ~/.dotfiles/scripts/aliases
source ~/.dotfiles/scripts/exports
source ~/.dotfiles/scripts/powerline
source ~/.dotfiles/scripts/osx
source ~/.dotfiles/scripts/dotupdate

# .dotfiles checks
source ~/.dotfiles/scripts/checks


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
