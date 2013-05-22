PATH="$HOME/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Use vim as an editor
EDITOR=vim

# Set history options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U compinit
compinit

source $HOME/.dotfiles/zsh/keybindings
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions
source $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

