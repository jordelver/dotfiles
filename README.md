# dotfiles

## Setup

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git ~/.dotfiles

Run the install

This will install everything from the `Brewfile` and link configs into ~/

    cd ~/.dotfiles

    ./install.sh

## Install ASDF

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1

### To upgrade

    cd ~/.asdf
    git pull
    cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

## Install FZF

Installed fzf using this method

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

## Vim (Neovim)

### To update

`brew reinstall neovim --HEAD`

### Adding a new plugin

Add a `Plug` line to `~/.nvimrc`

Save the file, source it `<leader>sv` and run `:PlugInstall`

Run `:PlugStatus` to see what needs installing and what doesn't

### Updating a plugin

Run `:PlugUpdate` from within Vim

