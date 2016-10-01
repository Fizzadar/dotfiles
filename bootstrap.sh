# Fizzadar's .dotfiles
# File: bootstrap.sh
# Desc: setup .dotfiles

set -e

echo "### Bootstrapping Fizzadar's .dotfiles..."
echo


# Check for existing dotfiles
if [ -d ~/.dotfiles ]; then
    echo "--> There already appears to be a ~/.dotfiles, exiting!"
    exit 1
fi

# Make the .dotfiles dir
mkdir -p ~/.dotfiles

# Clone it
git clone https://github.com/Fizzadar/dotfiles ~/.dotfiles

# Update/install it
source ~/.dotfiles/shell_scripts/dotupdate
dotupdate
