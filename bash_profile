##############################################################################
# Environment variables
##############################################################################
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PS1='\[\e[01;32m\]\u@\h\[\e[01;34m\] \w$(__git_ps1 "(%s)") \$\[\e[00m\] '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR='vim'
export INPUTRC="~/.inputrc"

##############################################################################
# Bash completion
##############################################################################
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Complete bash using the 'g' alias as well as 'git' if completion exists
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g
fi

##############################################################################
# Aliases
##############################################################################
alias ls="ls -G"
alias ll="ls -l"
alias lh="ls -lAd .*" # List only hidden files and directories

alias n="nano -w"
alias t="tail -f"
alias g="git"
alias m="mate"
alias o="open ."

# Get the current working directory with newlines removes
alias getpath='pwd | tr -d "\r\n" | pbcopy'

# SSH aliases
alias nas="ssh nas -t tmux a"
alias slicehost="ssh slicehost -t tmux a"

# Rails
alias sc="./script/console"
alias c="bundle exec cucumber"
alias b="bundle"
alias be="bundle exec"

##############################################################################
# Bash history
##############################################################################

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

##############################################################################
# Shell functions
##############################################################################

# Lowercase filenames of files in the current working directory
lcase() {
  for file in *
  do
    original=`basename $file`
    lowercase=`echo $file | tr '[:upper:]' '[:lower:]'`
    if [ "$lowercase" != "$original" ]
    then
      mv $original $lowercase
    fi
  done
}

##############################################################################
# Ruby environments - rbenv and rvm CANNOT co-exist on the same system
##############################################################################

# Add rbenv if it exists
if [ -d "$HOME/.rbenv/" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Add RVM if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
