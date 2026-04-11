#!/bin/sh

common="zsh tmux vim neovim lazygit jq ghostty"

fedora_copr="scottames/ghostty dejan/lazygit"
fedora="fira-code-fonts"

mac="font-fira-code"

if command -v dnf >/dev/null 2>&1; then
  for repo in $fedora_copr; do
    sudo dnf copr enable -y "$repo"
  done
  sudo dnf install -y $common $fedora
elif command -v brew >/dev/null 2>&1; then
  brew install $common $mac
fi

