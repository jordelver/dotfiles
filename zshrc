PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Set history options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Use vi key bindings
bindkey -v

# Let's rbenv!
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

