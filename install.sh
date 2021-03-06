#!/bin/sh

# Link dotfiles into place
echo "Linking config files into place"
for dotfile in *; do
  source="$PWD/$dotfile"
  target="$HOME/.$dotfile"
  if [[ "$dotfile" != "README.md" && "$dotfile" != "install.sh" && "$dotfile" != "Brewfile" ]]; then
    if [ ! -L "$target" ]; then
      echo "* $source -> $target"
      ln -s "$source" "$target"
    fi
  fi
done
echo "\nAll done"
