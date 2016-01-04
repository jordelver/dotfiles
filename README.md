# dotfiles

## Setup

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git ~/.dotfiles

Run the install script to link the configs into ~/

    cd ~/.dotfiles

    ./install.sh

## Vim (Neovim)

### To update

`brew reinstall neovim --HEAD`

### Adding a new plugin

Add a `Plug` line to `~/.nvimrc`

Save the file, source it `<leader>sv` and run `:PlugInstall`

Run `:PlugStatus` to see what needs installing and what doesn't

### Updating a plugin

Run `:PlugUpdate` from within Vim

