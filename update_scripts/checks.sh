#!/bin/sh


if [ ! $(which pyenv) ]; then
    echo "$(tput bold)$(tput setaf 1)pyenv missing!"
    echo "Run 'brew install pyenv pyenv-virtualenv' to use install/manage Python versions!$(tput sgr0)"
fi
