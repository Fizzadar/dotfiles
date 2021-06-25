# dotfiles

Fizzadar `.dotfiles`. Designed for use on MacOS & Ubuntu. Highlights:

+ [`bash-sensible`](https://github.com/mrzool/bash-sensible) for bash defaults
+ Customized shell [powerline prompt](https://github.com/Fizzadar/dotfiles/blob/master/shell_scripts/powerline)
+ [`pvagrant`](https://github.com/Fizzadar/dotfiles/blob/master/shell_scripts/functions/pvagrant) for parallel Vagrant commands for non-parallel providers (Vbox)
+ [`nmenv`](https://github.com/Fizzadar/dotfiles/blob/master/shell_scripts/functions/nmenv) hack to redirect `node_modules` somewhere else like a Python virtualenv
+ [`fizzenv`](https://github.com/Fizzadar/dotfiles/blob/master/shell_scripts/functions/fizzenv) custom `pyenv`-like script to run any generic activate/deactivate commands when entering a directory

## Install

```sh
# Risky
curl -sfS https://raw.githubusercontent.com/Fizzadar/dotfiles/develop/bootstrap.sh | bash

# Secure
# get contents of bootstrap.sh and paste into terminal
```

## Update

Includes an update script:

```sh
dotupdate
```
