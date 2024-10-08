return {
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = 'NotifyBackground',
      fps = 30,
      icons = {
        DEBUG = '',
        ERROR = '',
        INFO = '',
        TRACE = '✎',
        WARN = '',
      },
      level = 2,
      minimum_width = 50,
      render = 'compact',
      stages = 'fade',
      time_formats = {
        notification = '%T',
        notification_history = '%FT%T',
      },
      timeout = 5000,
      top_down = true,
    },
    config = function(_, opts)
      require('notify').setup(opts)
      -- Dismiss notifications
      vim.keymap.set('n', '<localleader>nn', '<cmd>lua require("notify").dismiss()<CR>', { noremap = true, silent = true, desc = '[N]otify [D]ismiss' })
      vim.keymap.set('i', '<C-n>', '<cmd>lua require("notify").dismiss()<CR>', { noremap = true, silent = true, desc = '[N]otify [D]ismiss' })
      -- Open notifications in telescope
      vim.keymap.set('n', '<localleader>no', '<cmd>Telescope notify<CR>', { silent = true, desc = '[N]otify [O]pen in telescope' })
    end,
  },
}
