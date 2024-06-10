local config = {}

-- user configs
local user_configs = {
  font = require 'configs.font',
  background = require 'configs.background',
  -- keybinds = require 'configs.keybinds',
  colors = require 'configs.color_schemes',
  misc = require 'configs.misc',
  appearance = require 'configs.appearance',
}

for i in pairs(user_configs) do
  user_configs[i].apply(config)
end

return config
