function dh -d "Fuzzily delete entries from your history"
  history | fzf | read -l item; and history delete --prefix "$item"
end
