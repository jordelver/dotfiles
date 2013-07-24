# Use vi key bindings
bindkey -v

# Use incremental search with CTRL-R
bindkey "^R" history-incremental-search-backward

# Bind UP and DOWN arrow keys
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

