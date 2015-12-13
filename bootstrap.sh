#!/bin/sh

# Fizzadar's .dotfiles
# File: bootstrap.sh
# Desc: bootstrap the .dotfiles

set -e

echo "### Bootstrapping Fizzadar's .dotfiles..."
echo

# Check ~/.dotfiles directory exists
if [ ! -d "${HOME}/.dotfiles" ]; then
    echo "--> No ~/.dotfiles located, failing!"
    exit 1
fi

# Loop through all dotfiles in ~/.dotfiles
for file in ` \
    find ~/.dotfiles/.* \
    -type f -maxdepth 0 \
    | grep -v .DS_Store \
    | grep -v .gitmodules \
`; do
    filename=`basename ${file}`

    if [ -h "${HOME}/${filename}" ]; then
        echo "--> ${filename} already symlinked"
    else
        echo "--> Linking: ${file} -> ~/${filename}"
        ln -s $file $HOME/$filename
    fi
done
echo

echo "--> Sourcing ~/.bash_profile"
source ~/.bash_profile

echo "<-- Bootstrap complete!"