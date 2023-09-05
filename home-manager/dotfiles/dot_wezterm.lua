local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- colors
config.color_scheme = 'Ayu Mirage'
config.colors = {
  cursor_fg = 'white'
}

-- window
config.window_decorations = "RESIZE"
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = 0,
  bottom = 0,
}

-- fonts
config.font = wezterm.font 'Anonymous Pro'
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false

-- tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config