#!/bin/sh

dotupdate() {
    echo "### Updating Fizzadar's .dotfiles..."
    echo

    # Check ~/.dotfiles directory exists
    if [ ! -d ~/.dotfiles ]; then
        echo "--> No ~/.dotfiles located, failing!"
        exit 1
    fi

    echo "Git pull..."

    # Get current directory, jump to .dotfiles
    local old_dir=$(pwd)
    cd ~/.dotfiles

    # Pull git updates
    git pull > /dev/null

    # Init/update submodules
    git submodule init > /dev/null
    git submodule update > /dev/null

    # Loop through all dotfiles in ~/.dotfiles
    echo "Link dotfiles..."
    for file in $(
        find .* \
        -type f -maxdepth 0 \
        | grep -v .DS_Store \
        | grep -v .gitmodules
    ); do
        local filename=`basename ${file}`

        if [ -h "${HOME}/${filename}" ]; then
            echo "--> ${filename} already symlinked"
        else
            echo "--> Linking: ${file} -> ~/${filename}"
            # ln -s ~/.dotfiles/$file $HOME/$filename
        fi
    done
    echo

    echo "Link configs..."
    cd ~/.dotfiles/configs

    # Loop through all config files in ~/.dotfiles/configs
    for file in $(find . -type f); do
        dir=$(dirname "$file")
        if [ ! -d "$HOME/.config/$dir" ]; then
            mkdir -p "$HOME/.config/$dir"
        fi
        if [ -h "${HOME}/.config/${file}" ]; then
            echo "--> ${file} already symlinked"
        else
            echo "--> Linking: ${file} -> ~/.config/${file}"
            ln -s ~/.dotfiles/configs/$file $HOME/.config/$file
        fi
    done
    echo

    # Jump back to original position
    cd "${old_dir}"

    echo "Wrap up..."
    echo "--> Execute update scripts"
    sh ~/.dotfiles/update_scripts/checks.sh
    sh ~/.dotfiles/update_scripts/macos.sh

    echo "--> Sourcing ~/.bash_profile"
    source ~/.bash_profile

    echo
    echo "<-- Update complete!"
}
