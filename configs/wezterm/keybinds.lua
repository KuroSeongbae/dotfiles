local wezterm = require 'wezterm'
local act = wezterm.action
-- local gui = wezterm.gui
-- local mux = wezterm.mux

local function merge_table(table1, table2)
  for _, k in ipairs(table2) do
    table.insert(table1, k)
  end
end

local function general(config)
  local keys = {
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
		{
      mods = 'ALT',
      key = 'd',
      action = wezterm.action.ShowDebugOverlay,
    },

  }

  merge_table(config.keys, keys)
end

local function search_and_copy(config)
	local keys = {
		{
      mods = 'ALT',
      key = '/',
      action = act.Search {CaseInSensitiveString = ''},
    },
		{
      mods = 'ALT',
      key = 's',
      action = act.ActivateCopyMode,
    },
	}

	local copy_keys = {
			['copy_mode'] = {
				{
					mods = 'NONE',
					key = 'j',
					action = act.CopyMode 'MoveLeft',
				},
				{
					mods = 'NONE',
					key = 'k',
					action = act.CopyMode 'MoveDown',
				},
				{
					mods = 'NONE',
					key = 'l',
					action = act.CopyMode 'MoveUp',
				},
				{
					mods = 'NONE',
					key = ';',
					action = act.CopyMode 'MoveRight',
				},
			}
		}

	--[[ table.insert(config.key_tables, copy_keys) ]]

	merge_table(config.keys, keys)
	merge_table(config.key_tables, copy_keys)
end

local function movement(config)
 local keys = {
    -- {
    --   mods = 'ALT',
    --   key = 'a',
    --   action = {
    --     act.ActivatePaneByIndex(get_current_pane() + 1)
    --     }
    -- },
    {
      mods = 'ALT|CTRL',
      key = 'j',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      mods = 'ALT|CTRL',
      key = 'k',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      mods = 'ALT|CTRL',
      key = 'l',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      mods = 'ALT|CTRL',
      key = ';',
      action = act.ActivatePaneDirection 'Right',
    },
  }

  merge_table(config.keys, keys)
end

local function scrolling(config)
	local keys = {
		{
			mods = 'ALT',
			key = 'k',
			action = act.ScrollByLine(4),
		},
		{
			mods = 'ALT',
			key = 'l',
			action = act.ScrollByLine(-4),
		},
		{
			mods = 'ALT',
			key = 'f',
			action = act.ScrollByPage(1),
		},
		{
			mods = 'ALT',
			key = 'b',
			action = act.ScrollByPage(-1),
		},
		{
			mods = 'ALT|SHIFT',
			key = 'f',
			action = act.ScrollByPage(0.5),
		},
		{
			mods = 'ALT|SHIFT',
			key = 'b',
			action = act.ScrollByPage(-0.5),
		},
		{
			mods = 'ALT',
			key = 'j',
			action = act.ScrollToTop,
		},
		{
			mods = 'ALT',
			key = ':',
			action = act.ScrollToBottom,
		},
		{
			mods = 'ALT|SHIFT',
			key = 'j',
			action = act.ScrollToPrompt(-1),
		},
		{
			mods = 'ALT|SHIFT',
			key = ';',
			action = act.ScrollToPrompt(1),
		},
	}

	merge_table(config.keys, keys)
end

local function multiplexer(config)
  local keys = {
    {
      mods = 'ALT',
      key = 'v',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      mods = 'ALT',
      key = 'h',
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
    },
		{
			mods = 'ALT|SHIFT',
			key = 'D',
			action = act.DetachDomain 'CurrentPaneDomain'
		},
		{
			mods = 'ALT',
			key = 'm',
			action = wezterm.action.ShowLauncher
		}
  }

merge_table(config.keys, keys)
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
  config.keys = {}
	config.key_tables = {}

  general(config)
	search_and_copy(config)
  movement(config)
	scrolling(config)
  multiplexer(config)
  activate_tab(config)
end

return module
