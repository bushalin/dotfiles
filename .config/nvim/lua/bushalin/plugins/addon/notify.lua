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
  },
}
