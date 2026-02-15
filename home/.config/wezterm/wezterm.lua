local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 12
config.font = wezterm.font 'Fira Code'
-- config.color_scheme = 'Tokyo Night (Gogh)'
config.color_scheme = 'Monokai Pro (Gogh)'


return config
