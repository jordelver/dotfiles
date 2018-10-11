# Use nvim as our editor
set -U EDITOR nvim

# Add various PATHs
set PATH ~/.bin $PATH

# Use `fd` instead of default `find`
# Search hidden files, but exclude `.git` and respect `.gitignore`
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Fix GPG not prompting for passphrase
# https://www.gnupg.org/documentation/manuals/gnupg/Common-Problems.html
set -x GPG_TTY (tty)

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

function fish_user_key_bindings

  # Vi mode keybindings
  fish_vi_key_bindings

  # Accept fish auto suggestions with CTRL-F
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion

  # CTRL-L to clear the screen
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

