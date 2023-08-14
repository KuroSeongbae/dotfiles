local wezterm = require 'wezterm'
local config = {}

-- Keybinds:
local keybinds = require 'keybinds'
keybinds.apply_keybinds(config)

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14.0

-- Spawn a nu shell in login mode
config.default_prog = { 'nu', '-l' }

return config
