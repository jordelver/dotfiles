# Use vi key bindings
bindkey -v

# Use incremental search with CTRL-R
bindkey "^R" history-incremental-search-backward

# Bind 'v' in Vi command mode to open the
# current command in Vim for editing
bindkey -M vicmd v edit-command-line

# Bind UP and DOWN arrow keys
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

