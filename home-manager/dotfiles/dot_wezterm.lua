local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Anonymous Pro'
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false
config.enable_tab_bar = false
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0cell',
  bottom = '0cell',
}

return config

