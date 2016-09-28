# Fizzadar's .dotfiles
# File: bootstrap.sh
# Desc: setup .dotfiles

set -e

echo "### Bootstrapping Fizzadar's .dotfiles..."
echo


# Check for existing dotfiles
if [ -d "${HOME}/.dotfiles" ]; then
    echo "--> There already appears to be a ~/.dotfiles, exiting!"
    exit 1
fi

# Make the .dotfiles dir
mkdir -p "${HOME}/.dotfiles"

# Clone it
git clone https://github.com/Fizzadar/dotfiles.git "${HOME}/.dotfiles"

# Update/install it
dotupdate
