local wezterm = require 'wezterm'
local io = require 'io'
local os = require 'os'
local act = wezterm.action
local keybinds = {}

-- Solid black profile
function background_preset_one(config, is_fullscreen)
  config.text_background_opacity = 0.85
  config.background = {
    {
      source = {
        File = wezterm.config_dir .. '/assets/cyberpunk-edgerunners-lucy-game-4k.jpeg',
      },
      horizontal_align = 'Center',
      vertical_align = 'Bottom',
      height = 'Cover',
      width = 'Cover',
      opacity = 1.00,
      hsb = {
        hue = 1.0,
        saturation = 1.00,
        brightness = 0.08,
      },
    },
  }
end

function background_preset_two(config, is_fullscreen)
  config.text_background_opacity = 0.90
  config.background = {
    {
      source = {
        -- File = { path = wezterm.config_dir .. '/assets/star-wars-jedi-logo.jpg' },
        File = wezterm.config_dir .. '/assets/star-wars-jedi-logo.jpg',
      },
      horizontal_align = 'Center',
      opacity = 1.00,
      hsb = {
        hue = 1.0,
        saturation = 1.00,
        brightness = 0.10,
      },
    },
  }
end

function background_preset_presentation(config, is_fullscreen)
  config.text_background_opacity = 1.00
  config.window_background_opacity = 0.95
  config.macos_window_background_blur = 20
  config.background = {
    {
      source = {
        -- File = { path = wezterm.config_dir .. '/assets/green-leaf-wallpaper.jpg' },
        -- { Color = 'black' },
        Gradient = {
          preset = 'Plasma',
          -- colors = { '#EEBD89', '#D13ABD' },
          -- -- Specifices a Linear gradient starting in the top left corner.
          -- orientation = {
          --   Linear = { angle = -45.0 },
          -- },
        },
      },
      horizontal_align = 'Center',
      opacity = 0.01,
      hsb = {
        hue = 1.0,
        saturation = 0.70,
        brightness = 0.20,
      },
    },
  }
end

function background_preset_three(config, is_fullscreen)
  config.text_background_opacity = 1.00
  -- config.window_background_opacity = 0.90
  config.window_background_gradient = {
    orientation = 'Vertical',
    colors = {
      '#0f0c29',
      '#302b63',
      '#24243e',
    },
    blend = 'Rgb',
  }
  config.background = {
    opacity = 0.01,
  }
end

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.text_background_opacity == 0.85 then
    overrides.text_background_opacity = 1.00
  else
    overrides.text_background_opacity = 0.85
  end
  window:set_config_overrides(overrides)
end)

wezterm.on('background_preset_one', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  background_preset_one(overrides, window:get_dimensions().is_full_screen)
  window:set_config_overrides(overrides)
end)

wezterm.on('background_preset_two', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  background_preset_two(overrides, window:get_dimensions().is_full_screen)
  window:set_config_overrides(overrides)
end)

wezterm.on('background_preset_three', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  background_preset_three(overrides, window:get_dimensions().is_full_screen)
  window:set_config_overrides(overrides)
end)

wezterm.on('background_preset_presentation', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  background_preset_presentation(overrides, window:get_dimensions().is_full_screen)
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
  config.leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = '1',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent 'background_preset_one',
    },
    {
      key = '2',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent 'background_preset_two',
    },
    {
      key = '3',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent 'background_preset_three',
    },
    {
      key = 'p',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent 'background_preset_presentation',
    },
    { key = 'o', mods = 'ALT', action = wezterm.action.EmitEvent 'open-nvim-with-scrollback' },
    { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
    { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
    { key = '"', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '%', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  }
end

return keybinds
