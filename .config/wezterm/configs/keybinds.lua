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

wezterm.on('open-nvim-with-scrollback', function(window, pane)
  local scrollback_text = pane:get_lines_as_text(pane:get_dimensions().scrollback_rows)

  local filename = os.tmpname()
  local f = io.open(filename, 'w+')
  f:write(scrollback_text)
  f:flush()
  f:close()

  local editor_command = { 'zsh', '--login', '-c', 'nvim ' .. filename }
  local _, new_pane, _ = window:mux_window():spawn_tab { args = editor_command }
  new_pane:send_text 'ge'

  -- Wait "enough" time for the editor to read the file before removing it.
  -- (Reading the file is asynchronous and not awaitable.)
  wezterm.sleep_ms(1000)
  os.remove(filename)
end)

function keybinds.apply(config)
  -- config.leader = { key = 'w', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = 'B',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.EmitEvent 'toggle-opacity',
    },
    { key = 'o', mods = 'ALT', action = wezterm.action.EmitEvent 'open-nvim-with-scrollback' },
    { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
    { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  }
end

return keybinds
