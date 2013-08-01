# Use the coreutils version of `ls` if installed
# and set coreutils only options
#
#   brew install coreutils
#

# Miscellaneous
alias reload='exec $SHELL'

# File / Directory navigation
if [[ -x $(which gls) ]]; then
  alias ls='gls -h --color --group-directories-first'
else
  alias ls='ls -G'
fi

alias ll='ls -l'
alias lh='ls -lAd .*' # List only hidden files and directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Utilities / Programs
alias t='tail -f'
alias c='clear'
alias tree='tree -C'
alias g="git"
alias m='mate'
alias o='open .'
alias n='nano -w'

# Servers
alias nas='ssh nas -t tmux a'
alias m3lky='ssh m3lky'
alias irc='ssh m3lky -t tmux a'
alias tunnel='ssh -D 8080 -f -N -C m3lky' # Setup a reverse SSH tunnel

# Rails / Ruby
alias b='bundle'
alias be='bundle exec'
alias bec='bundle exec cucumber --format=pretty'
alias sc='script/console'
alias ss='script/server'

