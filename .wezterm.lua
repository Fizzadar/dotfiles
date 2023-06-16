-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Apply overrides
local ayu_mirage = wezterm.color.get_builtin_schemes()['Ayu Mirage']

ayu_mirage.ansi = {
    '#191e2a',
    '#ed8274',
    '#a6cc70',
    '#fad07b',
    '#6dcbfa',
    '#cfbafa',
    '#649d8a',
    '#c7c7c7',
}
ayu_mirage.brights = {
    '#686868',
    '#f28779',
    '#bae67e',
    '#ffd580',
    '#73d0ff',
    '#d4bfff',
    '#77b8a2',
    '#ffffff',
}

config.color_schemes = {
  ['Ayu Mirage'] = ayu_mirage
}

config.color_scheme = 'Ayu Mirage'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 12.0
config.line_height = 1

config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = true
config.alternate_buffer_wheel_scroll_speed = 1

config.window_padding = {
  left = 20,
  right = 20,
  top = 25,
  bottom = 10,
}

config.keys = {
  -- Move between tabs
  { key = 'LeftArrow', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'SUPER', action = act.ActivateTabRelative(1) },
  -- Move tabs around
  { key = 'LeftArrow', mods = 'SUPER|SHIFT', action = act.MoveTabRelative(-1) },
  { key = 'RightArrow', mods = 'SUPER|SHIFT', action = act.MoveTabRelative(1) },
}

-- and finally, return the configuration to wezterm
return config
