local wezterm = require 'wezterm'
local color_schemes = {}

function color_schemes.apply(config)
  -- configs for colorscheme
  local gruvbox_dark = wezterm.get_builtin_color_schemes()['Gruvbox Dark (Gogh)']
  local catppucchin_macchiato = wezterm.get_builtin_color_schemes()['Catppuccin Macchiato']
  local catppucchin_latte = wezterm.get_builtin_color_schemes()['Catppuccin Latte']
  local cyberpunk = wezterm.get_builtin_color_schemes()['Cyberpunk']

  config.color_schemes = {
    ['catppucchin_macchiato'] = catppucchin_macchiato,
    ['catppucchin_latte'] = catppucchin_latte,
    ['gruvbox_dark'] = gruvbox_dark,
    ['cyberpunk'] = cyberpunk,
  }

  config.color_scheme = 'gruvbox_dark'
end

return color_schemes
