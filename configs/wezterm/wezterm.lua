local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14.0

-- Spawn a nu shell in login mode
config.default_prog = { '/usr/bin/nu', '-l' }

config.disable_default_key_bindings = true

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = act.CopyTo 'Clipboard',
  },
  {
    key = 'V',
    mods = 'CTRL|SHIFT',
    action = act.PasteFrom 'Clipboard',
  },
  {
    key = 't',
    mods = 'ALT',
    action = act.SpawnTab 'DefaultDomain',
  },
  {
    key = 'c',
    mods = 'ALT',
    action = act.CloseCurrentTab {confirm = true},
  },
}

return config
