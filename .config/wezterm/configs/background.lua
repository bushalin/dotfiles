local wezterm = require 'wezterm'
local background = {}

function background.apply(config)
  -- config.window_background_opacity = 1.0
  -- config.text_background_opacity = 0.7
  --
  -- -- path to the file must be a full path instead of relative path
  -- --
  -- config.window_background_image = wezterm.config_dir .. '/assets/katana_wallpaper.jpeg'
  -- config.window_background_image = wezterm.config_dir .. '/assets/cyberpunk-edgerunners-lucy-game-4k.jpeg'
  --
  -- config.window_background_image_hsb = {
  --   -- Darken the background image by reducing it to 1/3rd
  --   brightness = 0.08,
  --
  --   -- You can adjust the hue by scaling its value.
  --   -- a multiplier of 1.0 leaves the value unchanged.
  --   hue = 1.0,
  --
  --   -- You can adjust the saturation also.
  --   saturation = 1.0,
  -- }

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
