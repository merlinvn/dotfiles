local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

config = {
	automatically_reload_config = true,
	launch_menu = {},

	color_scheme = "tokyonight",

	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 14.0,

	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",

	window_background_opacity = 0.88,
	-- macos_window_background_blur = 30,

	window_background_gradient = {
		interpolation = "Linear",

		orientation = "Vertical",

		blend = "Rgb",

		colors = {
			"#11111b",
			"#181825",
		},
	},

	window_padding = {
		left = 16,
		right = 16,
		top = 24,
		bottom = 16,
	},

	send_composed_key_when_right_alt_is_pressed = false,
}

-- config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
local fish_bin_path = "/bin/fish"
if file_exists("/opt/homebrew/bin/fish") then
	fish_bin_path = "/opt/homebrew/bin/fish"
	config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
else
	config.default_prog = { "/bin/bash", "-l" }
end

table.insert(config.launch_menu, { label = "fish", args = { fish_bin_path, "-l" } })
table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })

return config
