##############################################################################
# Environment variables
##############################################################################
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PS1='\[\e[01;32m\]\u@\h\[\e[01;34m\] \w$(__git_ps1 "(%s)") \$\[\e[00m\] '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR='mate'
export INPUTRC="~/.inputrc"

##############################################################################
# Bash completion
##############################################################################
if [ -d /usr/local/etc/bash_completion.d/ ]; then
  . /usr/local/etc/bash_completion.d/*
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

# SSH aliases
alias nas="ssh nas -t tmux a"
alias slicehost="ssh slicehost -t tmux a"

# Rails
alias sc="./script/console"
alias c="bundle exec cucumber"

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