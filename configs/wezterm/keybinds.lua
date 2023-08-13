local wezterm = require 'wezterm'
local act = wezterm.action
-- local gui = wezterm.gui
-- local mux = wezterm.mux

local function general(config)
  config.keys = {
    -- Copy / Paste
    {
      mods = 'CTRL|SHIFT',
      key = 'C',
      action = act.CopyTo 'Clipboard',
    },
    {
      mods = 'CTRL|SHIFT',
      key = 'V',
      action = act.PasteFrom 'Clipboard',
    },
  }
end

local function movement(config)
  config.keys = {
    -- {
    --   mods = 'ALT',
    --   key = 'a',
    --   action = {
    --     act.ActivatePaneByIndex(get_current_pane() + 1)
    --     }
    -- },
    {
      mods = 'ALT',
      key = 'j',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      mods = 'ALT',
      key = 'k',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      mods = 'ALT',
      key = 'l',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      mods = 'ALT',
      key = ';',
      action = act.ActivatePaneDirection 'Right',
    },
  }
end

local function multiplexer(config)
  config.keys = {
    {
      mods = 'ALT',
      key = 'h',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      mods = 'ALT',
      key = 'v',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      mods = 'ALT',
      key = 'x',
      action = act.CloseCurrentPane {confirm = true},
    },
    {
      mods = 'ALT',
      key = 't',
      action = act.SpawnTab 'DefaultDomain',
    },
    {
      mods = 'ALT',
      key = 'c',
      action = act.CloseCurrentTab {confirm = true},
    }
  }
end

local function activate_tab(config)
  for i = 1, 8 do
  -- ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
  end
end

local module = {}

-- local function get_current_pane()
--   local windows = mux.all_windows()
--   for _, window in ipairs(windows) do
--     local g_window = window.gui_window()
--     if g_window.is_focused() then
--       local pane = g_window.active_pane()
--       return pane.pane_id()
--     end
--   end
-- end
--

function module.apply_keybinds(config)
  config.disable_default_key_bindings = true
  general(config)
  movement(config)
  multiplexer(config)
  activate_tab(config)
end

return module
