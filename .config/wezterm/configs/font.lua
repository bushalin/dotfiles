local wezterm = require 'wezterm'
local font = {}

function font.apply(config)
  config.font_size = 15
  config.font = wezterm.font_with_fallback {
    {
      family = "Monaspace Neon",
      -- family = "Monaspace Argon",
      -- family = 'Monaspace Xenon',
      -- family = "Monaspace Radon",
      -- family = "Monaspace Krypton",
      weight = 'Light',
      harfbuzz_features = {
        'calt',
        'liga',
        'dlig',
        'ss01',
        'ss02',
        'ss03',
        'ss04',
        'ss05',
        'ss06',
        'ss07',
        'ss08',
      },
    },
    {
      family = 'Hack Nerd Font Mono',
      weight = 'Light',
    },
  }
  config.font_rules = {
    --
    -- Italic (comments)
    --
    {
      intensity = 'Normal',
      italic = true,
      font = wezterm.font {
        family = 'Monaspace Radon',
        weight = 'ExtraLight',
        stretch = 'Normal',
        style = 'Normal',
        harfbuzz_features = {
          'calt',
          'liga',
          'dlig',
          'ss01',
          'ss02',
          'ss03',
          'ss04',
          'ss05',
          'ss06',
          'ss07',
          'ss08',
        },
      },
    },

    --
    -- Bold (highlighting)
    --
    {
      intensity = 'Bold',
      italic = false,
      font = wezterm.font {
        family = 'Monaspace Xenon',
        weight = 'Bold',
        stretch = 'Normal',
        style = 'Normal',
        harfbuzz_features = {
          'calt',
          'liga',
          'dlig',
          'ss01',
          'ss02',
          'ss03',
          'ss04',
          'ss05',
          'ss06',
          'ss07',
          'ss08',
        },
      },
    },
    {
      intensity = 'Bold',
      italic = true,
      font = wezterm.font {
        family = 'Monaspace Xenon',
        weight = 'Bold',
        stretch = 'Normal',
        style = 'Normal',
        harfbuzz_features = {
          'calt',
          'liga',
          'dlig',
          'ss01',
          'ss02',
          'ss03',
          'ss04',
          'ss05',
          'ss06',
          'ss07',
          'ss08',
        },
      },
    },
  }
end

return font
