local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.use_resize_increments = true

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
 left = 0,
 right = 0,
 top = '0.2cell',
 bottom = '0.2cell',
}

config.font_size = 12
config.font = wezterm.font 'Fira Code'
config.color_scheme = 'Tokyo Night'

return config
