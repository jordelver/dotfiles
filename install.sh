#!/bin/sh
for dotfile in *; do
  source="$PWD/$dotfile"
  target="$HOME/.$dotfile"
  if [[ "$dotfile" != "README" && "$dotfile" != "install.sh" ]]; then
    ln -s "$source" "$target"
  fi
done
