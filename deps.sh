#!/bin/sh

common="zsh tmux vim neovim lazygit jq"
fedora="fira-code-fonts"
mac="font-fira-code"

if command -v dnf >/dev/null 2>&1; then
  sudo dnf install $common $fedora
elif command -v brew >/dev/null 2>&1; then
  brew install $common $mac
fi
