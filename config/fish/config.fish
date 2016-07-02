set -U EDITOR nvim
set PATH ~/.bin $PATH
source /usr/local/opt/fry/share/fry/fry.fish
alias be "bundle exec"
alias hb "hub browse"
alias pr "hub pull-request"
alias cb "cargo build"
alias cr "cargo run"
alias ct "cargo test"
alias vim "nvim"
eval (hub alias -s)

set fish_greeting # Turn off the fish welcome message

function fish_user_key_bindings
  fish_vi_mode
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion
  bind -M insert \cl 'clear; commandline -f repaint'
end

set -x GOPATH $HOME/projects/go
