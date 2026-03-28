#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/iamusualguy/dot.files"
DOTFILES_DIR="$HOME/.dotfiles"

echo "[*] Cloning or updating dotfiles..."
if [ -d "$DOTFILES_DIR" ]; then
    git -C "$DOTFILES_DIR" pull
else
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

echo "[*] Applying dotfiles..."

rsync -avh --backup --suffix=".bak" --exclude=".git" "$DOTFILES_DIR"/ "$HOME"/

echo "[*] Done."
