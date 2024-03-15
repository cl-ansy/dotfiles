# dotfiles

### Installing patched FiraCode - https://www.nerdfonts.com/

```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "FiraCode Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Nerd%20Font%20Complete.ttf
```

### Linking dotfiles

Assuming XDG_CONFIG_HOME is ~/.config

```bash
for dir in ./.config/*; do; ln -s $dir ~/.config/; done
```
