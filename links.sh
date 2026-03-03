#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

link() {
  local src="$1"
  local dest="$2"

  # Already correct symlink, skip
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "  skip   $dest"
    return
  fi

  # Existing file/dir/wrong symlink, back it up
  if [[ -e "$dest" || -L "$dest" ]]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "  backup $dest → $BACKUP_DIR/$(basename "$dest")"
  fi

  ln -s "$src" "$dest"
  echo "  link   $src → $dest"
}

echo "Linking ~/.config entries"
for src in "$DOTFILES_DIR"/home/.config/*/; do
  src="${src%/}"
  dest="$HOME/.config/$(basename "$src")"
  link "$src" "$dest"
done

echo "Linking home files"
link "$DOTFILES_DIR/home/.zshenv" "$HOME/.zshenv"

SUBLIME_DIR="$HOME/.config/sublime-text/Packages/User"
mkdir -p "$SUBLIME_DIR"
link "$DOTFILES_DIR/home/Preferences.sublime-settings" "$SUBLIME_DIR/Preferences.sublime-settings"
