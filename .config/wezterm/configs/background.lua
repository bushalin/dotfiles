local wezterm = require 'wezterm'
local background = {}

function background.apply(config)
  config.text_background_opacity = 0.85
  config.background = {
    {
      source = {
        File = wezterm.config_dir .. '/assets/cyberpunk-edgerunners-lucy-game-4k.jpeg',
        -- File = wezterm.config_dir .. '/assets/katana_wallpaper.jpeg'
      },
      horizontal_align = 'Center',
      vertical_align = 'Bottom',
      height = 'Cover',
      width = 'Cover',
      hsb = {
        brightness = 0.08,
        hue = 1.0,
        saturation = 1.0,
      },
    },
  }

  config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  }

  config.window_decorations = 'RESIZE'
end

return background
