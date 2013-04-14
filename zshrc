PATH="$HOME/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Use vim as an editor
EDITOR=vim

# Set history options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Use vi key bindings
bindkey -v

# Use incremental search with CTRL-R
bindkey "^R" history-incremental-search-backward

source $HOME/.dotfiles/zsh/aliases

# Let's rbenv!
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

