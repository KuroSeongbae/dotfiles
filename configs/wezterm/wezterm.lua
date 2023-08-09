local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- Keybinds:
local keybinds = require 'keybinds'
keybinds.apply_keybinds(config)

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14.0

-- Spawn a nu shell in login mode
config.default_prog = { '/usr/bin/nu', '-l' }

config.disable_default_key_bindings = true

return config
