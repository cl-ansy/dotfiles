#!/bin/sh

common="zsh tmux vim neovim lazygit jq ghostty"

fedora_copr="scottames/ghostty"
fedora="fira-code-fonts"

mac="font-fira-code"

if command -v dnf >/dev/null 2>&1; then
  sudo dnf copr enable $fedora_copr
  sudo dnf install $common $fedora
elif command -v brew >/dev/null 2>&1; then
  brew install $common $mac
fi

