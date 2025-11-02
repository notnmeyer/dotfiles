local wezterm = require("wezterm")
local config = {}

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Ayu Mirage'
  else
    return 'ayu_light'
  end
end

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.native_macos_fullscreen_mode = true

config.color_scheme = scheme_for_appearance(get_appearance())

-- window
-- config.window_decorations = "TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR" -- net yet, only in nightlies
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "2cell",
	bottom = "2cell",
}
-- set the initial size of the window
config.initial_rows = 44

-- fonts
config.font = wezterm.font_with_fallback {
	{ family = "Dank Mono" },
	{ family = "Anonymous Pro" },
}
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false

-- tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

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
