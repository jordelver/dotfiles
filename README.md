dotfiles
========

Inital setup
------------

Clone the repo to ~/.dotfiles

    git clone git@github.com:jordelver/dotfiles.git

Setup git submodules (used for managing external vim plugins)

    git submodule init
    git submodule update

Run the install script to link the configs into ~/

    cd ~/.dotfiles

    ./install.sh


Adding a new vim plugin
-----------------------

From the root of the repo

    git submodule add <git-repo-url> vim/bundle/<plugin-name>