autoload zmv

function rrg {
  rake routes | grep $1
}

# Use rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Use chruby if installed
if [ -d /usr/local/share/chruby/ ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

