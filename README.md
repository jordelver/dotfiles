# dotfiles

## Initial setup

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git

Setup git submodules (used for managing external vim plugins)

    git submodule init
    git submodule update

Run the install script to link the configs into ~/

    cd ~/.dotfiles

    ./install.sh

Copy git-commit-template to ~/.git-commit-template if required

## Adding a new vim plugin

From the root of the repo

    git submodule add <git-repo-url> vim/bundle/<plugin-name>

## Updating vim plugins

Change into the plugin directory

    cd vim/bundle/<plugin-name>

Checkout the master (or which ever) branch and pull the latest commits

    git co master
    git pull origin master

Commit the changes in the main repository

