local config = wezterm.config_builder()

local act = wezterm.action

config.color_scheme = 'Orthodox Scheme'

config.window_background_image = '/Users/tommycalvy/Documents/thomas_cole_the_voyage_of_life_1842.jpg'

config.window_background_image_hsb = {
	brightness = 0.1
}

config.hide_tab_bar_if_only_one_tab = true

config.color_schemes = {
	['Orthodox Scheme'] = {
		background = 'black',
		foreground = '#fdecce',
		ansi = {
		      "#000000", -- black
		      "#cc0000", -- red
		      "#4e9a06", -- green
		      "#c4a000", -- yellow
		      "#3465a4", -- blue
		      "#75507b", -- magenta
		      "#a8e3d0", -- cyan
		      "#d3d7cf", -- white
	    	},
		    -- Bright ANSI colors (8-15)
	   	brights = {
		      "#555753", -- bright black
		      "#ef2929", -- bright red
		      "#8ae234", -- bright green
		      "#fce94f", -- bright yellow
		      "#729fcf", -- bright blue
		      "#ad7fa8", -- bright magenta
		      "#66f2d8", -- bright cyan
		      "#eeeeec", -- bright white
	    	},
	},
}

-- timeout_milliseconds defaults to 1000 and can be omitted
-- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
	  key = 'a',
	  mods = 'CTRL',
	  action = act.ActivateKeyTable {
		  name = 'modify_pane',
		  one_shot = false,
		  until_unknown = true,
		  timeout_milliseconds = 1000,
	  },
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Down',
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = act.SendKey { key = 'a', mods = 'CTRL' },
  },

}

config.key_tables = {
	modify_pane = {
	  { key = '\\', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	  { key = '-', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	  { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
	  { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
	  { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
	  { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
	  { key = 'q', action = act.CloseCurrentPane { confirm = true } },
	},
}

return config
