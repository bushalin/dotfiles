local module = {}

function module.apply(config)
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = true
end

return module
