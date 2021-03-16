function dh -d "Fuzzily delete entries from your history"
  history | fzf --multi | while read -l item
    history delete --case-sensitive --exact "$item"
  end
end
