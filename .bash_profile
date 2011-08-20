##################################################
# Environment variables
##################################################
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/Users/jord/homebrew/bin:$PATH"
export PS1='\[\e[01;32m\]\u@\h\[\e[01;34m\] \w$(__git_ps1 "(%s)") \$\[\e[00m\] '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR='mate'

##############################################################################
# Bash completion
##############################################################################
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
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

# SSH aliases
alias nas="ssh nas -t tmux a"
alias slicehost="ssh slicehost -t tmux a"

# Rails
alias sc="./script/console"

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
