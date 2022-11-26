# dotfiles

1. Install Oh-My-Zsh

2. Install patched FiraCode - https://www.nerdfonts.com/

> mkdir -p ~/.local/share/fonts
> cd ~/.local/share/fonts
> curl -fLo "FiraCode Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Nerd%20Font%20Complete.ttf

3. Install Packer - https://github.com/wbthomason/packer.nvim#quickstart

4. Link dotfiles

> # Assuming XDG_CONFIG_HOME is ~/.config
> ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
> ln -s ~/dotfiles/nvim ~/.config/nvim

