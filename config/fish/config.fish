# Use nvim as our editor
set -x EDITOR nvim

# Add various PATHs
set PATH $HOME/.cargo/bin $HOME/.bin $PATH

# Use nvim as manpager `:h Man`
set -x MANPAGER 'nvim +Man!'

# Use `fd` instead of default `find`
# Search hidden files, but exclude `.git` and respect `.gitignore`
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Fix GPG not prompting for passphrase
# https://www.gnupg.org/documentation/manuals/gnupg/Common-Problems.html
set -x GPG_TTY (tty)

# Turn on shell history for Elixir's iex
set -x ERL_AFLAGS '-kernel shell_history enabled'

# Aliases
alias be "bundle exec"
alias hb "gh repo view --web"
alias pr "hub pull-request"
alias vim "nvim"
alias o "open ."

# Turn off the fish welcome message
set fish_greeting

function fish_user_key_bindings

  # Vi mode keybindings
  fish_vi_key_bindings

  # Accept fish auto suggestions with CTRL-F
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion

  # CTRL-l to clear the screen
  bind -M insert \cl 'clear; commandline -f repaint'

  # Use CTRL-k and CTRL-j to move up and down through history
  # Usually up and down arrow keys
  bind -M insert \ck up-or-search
  bind -M insert \cj down-or-search

  # Loads the keybindings for fzf
  # The keybindings (and functions) themselves are shipped with fzf,
  # and installed by running `cd ~/.fzf; ./install --key-bindings`.
  #
  # The install process will create a symlink to the functions in ~/.fzf
  #
  #   config/fish/functions/fzf_key_bindings.fish -> ~/.fzf/shell/key-bindings.fish
  #
  fzf_key_bindings

  # Bind the fzf-cd-widget to ALT-C
  #
  # This is a workaround because the offical fix is to change ALT-C to
  # send Meta, but we can't do that because we will lose the ability to
  # type a # symbol.
  #
  # The other workaround is use use ESC-C, but we can't use that either
  # because we're using Vim keybindings as when ESC is pressed we go
  # out of insert mode.
  #
  # https://github.com/junegunn/fzf/issues/164
  #
  bind -M insert "ç" fzf-cd-widget
end

# Turn on direnv to manage per directory environment variables
eval (direnv hook fish)

# Use ASDF to manage versions for Ruby, Elixir, and others
if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  echo "Install asdf"
end

