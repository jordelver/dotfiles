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

## Install asdf

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

### Install plugins

Neovim

    asdf plugin add neovim

Ruby

    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

Erlang

    asdf plugin-add https://github.com/asdf-vm/asdf-erlang

Elixir

    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

NodeJS

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs

PostgreSQL

    asdf plugin-add postgres

### To upgrade

    cd ~/.asdf
    git pull
    cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

## Configure fzf

fzf is installed via Homebrew, but we need to configure it after install.

Run the install script

    /usr/local/opt/fzf/install --key-bindings --no-completion --no-bash --no-zsh --no-update-rc

## Vim (Neovim)

Neovim versions are managed by `asdf` like other tools. Change the version in
`~/.tool-versions`.

### To update

    asdf uninstall neovim nightly
    asdf install neovim nightly

### Adding a new plugin

Add to the plugin definition to `~/.config/nvim/lua/config/plugins/` and run
`:Lazy`.

### Updating a plugin

Run `:Lazy` and choose to update from there.

## Fonts

My current font of choice is [Jet Brains Mono](https://www.jetbrains.com/lp/mono/)
set to 18pts in iTerm. The font lives in this repo at `fonts/JetBrainsMono-Regular.ttf`.

To install, the font should be copied to `~/Library/Fonts/`.

    cp ~/.dotfiles/fonts/JetBrainsMono-Regular.ttf ~/Library/Fonts/

