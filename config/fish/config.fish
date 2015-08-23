set -U EDITOR nvim
source /usr/local/opt/fry/share/fry/fry.fish
alias be "bundle exec"
alias hb "hub browse"
alias vim "nvim"
eval (hub alias -s)

set fish_greeting # Turn off the fish welcome message

function fish_user_key_bindings
  fish_vi_mode
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion
end

