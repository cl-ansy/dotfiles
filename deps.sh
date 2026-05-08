#!/bin/sh

common="zsh tmux vim neovim lazygit jq ghostty zellij"

fedora_copr="scottames/ghostty dejan/lazygit varlad/zellij"
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

