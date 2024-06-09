local wezterm = require 'wezterm'
local keybinds = {}

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_image_hsb then
    overrides.window_background_image_hsb = { brightness = 0.08 }
  else
    overrides.window_background_image_hsb = { brightness = 0.00 }
  end
  window:set_config_overrides(overrides)
end)

function keybinds.apply(config)
  -- config.leader = { key = 'w', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = 'B',
      mods = 'CTRL|SHIFT',
      -- action = wezterm.action.EmitEvent 'toggle-opacity',
      action = wezterm.action.EmitEvent 'toggle-opacity',
    },
  }
end

return keybinds
