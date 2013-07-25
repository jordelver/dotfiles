autoload -U compinit
compinit

fpath=(
  ~/.zsh/completions
  $fpath
)

source ~/.zsh/completions/git-flow-completion.zsh

