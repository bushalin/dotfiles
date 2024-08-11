local wezterm = require 'wezterm'
local font = {}

function font.apply(config)
  config.font_size = 15
  config.font = wezterm.font_with_fallback {
    {
      family = 'Monaspace Neon Var',
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
        'ss09',
      },
    },
    {
      family = 'Hack Nerd Font Mono',
      weight = 'Light',
    },
  }
  config.font_rules = {

    -- Normal
    {
      intensity = 'Normal',
      italic = false,
      font = wezterm.font {
        family = 'Monaspace Neon',
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
          'ss09',
        },
      },
    },

    -- Bold
    {
      intensity = 'Bold',
      italic = false,
      font = wezterm.font_with_fallback {
        family = 'Monaspace Neon',
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
          'ss09',
        },
      },
    },

    -- Bold Italic
    {
      intensity = 'Bold',
      italic = true,
      font = wezterm.font_with_fallback {
        family = 'Monaspace Xenon',
        weight = 'Bold',
        stretch = 'SemiExpanded',
        style = 'Italic',
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
          'ss09',
        },
      },
    },
    -- normal-intensity-and-italic
    {
      intensity = 'Normal',
      italic = true,
      font = wezterm.font_with_fallback {
        family = 'Monaspace Xenon',
        weight = 'Regular',
        stretch = 'Normal',
        style = 'Italic',
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
          'ss09',
        },
      },
    },

    -- half-intensity-and-italic (half-bright or dim); use a lighter weight font
    {
      intensity = 'Half',
      italic = true,
      font = wezterm.font_with_fallback {
        family = 'Monaspace Neon',
        weight = 'Normal',
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
          'ss09',
        },
      },
    },

    -- half-intensity-and-not-italic
    {
      intensity = 'Half',
      italic = false,
      font = wezterm.font_with_fallback {
        family = 'Monaspace Neon',
        weight = 'Normal',
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
          'ss09',
        },
      },
    },
  }
end

return font
