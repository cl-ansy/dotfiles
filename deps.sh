#!/bin/sh

if command -v dnf >/dev/null 2>&1; then
  sudo dnf install zsh fira-code-fonts vim neovim lazygit
elif command -v brew &>/dev/null 2>&1; then
  brew install zsh font-fira-code neovim lazygit jq
fi
