local wezterm = require 'wezterm'
local config = {}

config.enable_wayland = false

-- Keybinds:
local keybinds = require 'keybinds'
keybinds.apply_keybinds(config)

--[[ config.color_scheme = 'Catppuccin Mocha' ]]
config.color_scheme = 'Tokyo Night'
config.font_size = 14.0
config.xcursor_theme = 'Bibata-Modern-Classic'

-- Spawn a nu shell in login mode
config.default_prog = { 'nu', '-l' }

return config
