-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = {
	-- "wsl.exe",
	"pwsh.exe",
	-- "powershell.exe",
}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({ "Iosevka Nerd Font", "JetBrains Mono" })
config.font_size = 18
config.line_height = 1.2
-- -- Hides Wezterm Tab bar on top
config.enable_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
--config.window_background_opacity = 0.8
config.mux_enable_ssh_agent = false

return config
