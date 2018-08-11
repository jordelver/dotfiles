# Use nvim as our editor
set -U EDITOR nvim

# Add various PATHs
set PATH ~/.bin $PATH

# Use `fd` instead of default `find`
# Search hidden files, but exclude `.git` and respect `.gitignore`
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Aliases
alias be "bundle exec"
alias hb "hub browse"
alias pr "hub pull-request"
alias vim "nvim"
alias o "open ."
alias gh "fg"

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

# Use ASDF to manage versions for Ruby, Elixir, and others
if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  echo "Install asdf"
end

