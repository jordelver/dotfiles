fpath=(
  ~/.zsh/functions
  $fpath
)

setopt promptsubst

# Load the prompt theme system
autoload -U promptinit
promptinit

# Use the wunjo prompt theme
prompt jord

