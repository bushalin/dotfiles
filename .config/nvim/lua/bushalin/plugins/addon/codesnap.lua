return {
  {
    'mistricky/codesnap.nvim',
    enabled = true,
    build = 'make',
    keys = {
      { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
      { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    },
    cmd = { 'CodeSnap', 'CodeSnapSave' },
    config = function()
      local opts = {
        mac_window_bar = false,
        title = 'CodeSnap.nvim',
        code_font_family = 'Hack Nerd Font Mono',
        watermark_font_family = 'Pacifico',
        watermark = '',
        bg_theme = 'bamboo',
        -- bg_color = '#535c68',
        breadcrumbs_separator = '/',
        has_breadcrumbs = true,
        has_line_number = true,
        min_width = 0,
        show_workspace = true,
        bg_x_padding = 0,
        bg_y_padding = 0,
        save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME").. "/Desktop/Codesnap/")
      }
      require('codesnap').setup(opts)
    end,
  },
}
