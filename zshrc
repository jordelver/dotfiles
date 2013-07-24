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

source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set grep colour options
export GREP_COLOR="30;43"
export GREP_OPTIONS="--color"

# Use rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Use chruby if installed
if [ -d /usr/local/share/chruby/ ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

