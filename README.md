# dotfiles

## Setup

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git ~/.dotfiles

Run the install script to link the configs into ~/

    cd ~/.dotfiles

    ./install.sh

## Vim

### Adding a new plugin

Add a `Plugin` line to `~/.vimrc`

Save the file, source it `<leader>sv` and run `:PluginInstall`

### Updating a plugin

Run `:PluginUpdate` from within Vim

