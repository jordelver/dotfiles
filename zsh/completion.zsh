autoload -U compinit
compinit

fpath=(
  ~/.zsh/completions
  $fpath
)

source ~/.zsh/completions/git-flow-completion.zsh

# Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

