# dotfiles

## Install dotfiles

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git ~/.dotfiles

Run the install

This will link configs into ~/

    cd ~/.dotfiles
    ./install.sh

## Install Homebrew

First we need to install Homebrew.

    bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## Install utilities

    cd ~/.dotfiles/
    brew bundle

## Install ASDF

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

### To upgrade

    cd ~/.asdf
    git pull
    cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

## Configure fzf

fzf is installed via Homebrew, but we need to configure it after install.

Run the install script

    /usr/local/opt/fzf/install --key-bindings --no-completion --no-bash --no-zsh --no-update-rc

## Vim (Neovim)

### To update

`brew reinstall neovim --HEAD`

### Adding a new plugin

Add a `Plug` line to `~/.nvimrc`

Save the file, source it `<leader>sv` and run `:PlugInstall`

Run `:PlugStatus` to see what needs installing and what doesn't

### Updating a plugin

Run `:PlugUpdate` from within Vim

