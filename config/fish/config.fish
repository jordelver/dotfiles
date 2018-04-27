# Use nvim as our editor
set -U EDITOR nvim

# Add various PATHs
set PATH ~/.bin ~/.cargo/bin $PATH

# Set the `GOPATH` for Go projects :rolleyes:
set -x GOPATH $HOME/Projects/go

# Use `fd` instead of default `find`
# Search hidden files, but exclude `.git` and respect `.gitignore`
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Include the Fish Ruby version manager
source /usr/local/opt/fry/share/fry/fry.fish

# Aliases
alias be "bundle exec"
alias hb "hub browse"
alias pr "hub pull-request"
alias vim "nvim"

# Setup `hub` Git wrapper
eval (hub alias -s)

# Turn off the fish welcome message
set fish_greeting

# Magic to enable vi keybindings
function fish_user_key_bindings
  fish_vi_mode
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion
  bind -M insert \cl 'clear; commandline -f repaint'
end

# Turn on direnv to manage per directory environment variables
eval (direnv hook fish)

# Fuzzy finding for changing Ruby version with Fry
function cr -d "Switch Rubies fuzzily"
  set ruby (fry | cut -c 3- | sed 's/ruby-//' | fzf --ansi)
  fry use $ruby
end

