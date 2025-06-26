#!/bin/bash

# Vérifie que 2 arguments sont donnés
if [ $# -lt 2 ]; then
  echo "Usage : $0 <old_name> <new_name> [repertory]"
  exit 1
fi

OLD_NAME="$1"
NEW_NAME="$2"
BASE_DIR="${3:-.}"  # Répertoire courant par défaut

# Recherche et renommage
find "$BASE_DIR" -type f -name "$OLD_NAME" | while read -r file; do
  dir=$(dirname "$file")
  target="$dir/$NEW_NAME"

  if [ -e "$target" ]; then
    echo "$NEW_NAME already exist in $dir — file ignored."
  else
    mv "$file" "$target"
    echo "Rename : $file → $target"
  fi
done
