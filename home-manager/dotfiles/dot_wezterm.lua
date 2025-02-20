local wezterm = require("wezterm")
local config = {}

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Builtin Solarized Light'
  end
end

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.native_macos_fullscreen_mode = true

-- colors
config.color_scheme = scheme_for_appearance(get_appearance())
-- "darkmoss (base16)"
config.colors = {
	cursor_fg = "white",
}

-- window
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0",
	bottom = 0,
}
config.window_background_opacity = 0.90
config.macos_window_background_blur = 20

-- set the initial size of the window
config.initial_rows = 44

-- fonts
config.font = wezterm.font_with_fallback {
	{ family = "Dank Mono" },
	{ family = "Anonymous Pro" },
}
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false

-- tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- background
-- local dimmer = { brightness = 0.1 }
-- config.background = {
--   {
--     source = {
--       File = '/Users/nate/Library/Mobile Documents/com~apple~CloudDocs/Wallpaper/6jijxrw6nfn01.jpg'
--     },
--     hsb = dimmer
--   }
-- }

-- keybinds
config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

config.default_prog = { os.getenv('HOME') .. "/.nix-profile/bin/zellij", "-l", "welcome" }

return config
