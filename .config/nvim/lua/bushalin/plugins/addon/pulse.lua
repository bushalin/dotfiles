return {
  {
    'linguini1/pulse.nvim',
    config = function()
      local pulse = require 'pulse'
      pulse.setup {
        level = vim.log.levels.WARN,
      }
      pulse.add('break-timer', {
        interval = 30,
        message = 'Take a break!',
        enabled = true,
      })
    end,
  },
}
