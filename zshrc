PATH="$HOME/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Use vim as an editor
EDITOR=vim

# Set history options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source $HOME/.dotfiles/zsh/keybindings
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions

# Use rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

