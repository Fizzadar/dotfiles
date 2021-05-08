#!/bin/sh

# Setup path
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/opt/bin:/opt/sbin:/usr/local/sbin:$PATH
export PATH

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8'

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Nano > vim!
export EDITOR=nano

# Make .vagrant directories machine-specific
# NOTE: sed is because MacOS is *extremely* prone to randomly putting or
# removing .local at the end of the machine hostname at random on login
export VAGRANT_DOTFILE_PATH=".vagrant-`hostname | sed s/\.local//`"
