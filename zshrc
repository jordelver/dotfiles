typeset -U path

# Explicitly state PATH
path=(
  $HOME/bin
  /usr/local/share/npm/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
)

# Use vim as an editor
export EDITOR=vim

# Set history options
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

autoload -U compinit
compinit

source $HOME/.dotfiles/zsh/keybindings
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions
source $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set grep colour options
export GREP_COLOR="30;43"
export GREP_OPTIONS="--color"

# Use rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

