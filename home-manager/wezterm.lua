local config = wezterm.config_builder()

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
return config
