local wezterm = require 'wezterm'
local io = require 'io'
local os = require 'os'
local act = wezterm.action
local keybinds = {}

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.text_background_opacity == 0.85 then
    overrides.text_background_opacity = 1.00
  else
    overrides.text_background_opacity = 0.85
  end
  window:set_config_overrides(overrides)
end)
function keybinds.apply(config)
  -- config.leader = { key = 'w', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = 'B',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.EmitEvent 'toggle-opacity',
    },
  }
end

return keybinds
