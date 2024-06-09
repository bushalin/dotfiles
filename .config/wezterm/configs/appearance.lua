local wezterm = require 'wezterm'
local apperance = {}

function apperance.apply(config)
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_bar_at_bottom = true

  config.window_frame = {
    font = wezterm.font { family = 'Monaspace Argon', weight = 'Bold' },
    font_size = 13,
    -- -- The overall background color of the tab bar when
    -- -- the window is focused
    active_titlebar_bg = '#333333',
    --
    -- -- The overall background color of the tab bar when
    -- -- the window is not focused
    inactive_titlebar_bg = '#333333',
  }

  -- config for tab bar
  config.colors = {
    tab_bar = {
      -- background = '#0b0022',
      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#2b2042',
        -- The color of the text for the tab
        fg_color = '#c0c0c0',

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Bold',

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = 'None',

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',

        strikethrough = false,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },
    },
  }

  config.inactive_pane_hsb = {
    saturation = 0.6,
    brightness = 0.8,
  }
end

return apperance
