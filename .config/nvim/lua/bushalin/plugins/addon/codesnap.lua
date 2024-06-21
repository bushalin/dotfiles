return {
  {
    'mistricky/codesnap.nvim',
    build = 'make build_generator',
    keys = { '<leader>cc' },
    -- keys = {
    --   { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    --   { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    -- },
    cmd = { 'CodeSnap', 'CodeSnapSave' },
    config = function()
      local opts = {
        save_path = '~/Desktop/Codesnap/',

        -- NOTE:
        -- default options
        mac_window_bar = true,
        title = 'CodeSnap.nvim',
        code_font_family = 'CaskaydiaCove Nerd Font',
        watermark_font_family = 'Pacifico',
        watermark = '',
        bg_theme = 'sea',
        breadcrumbs_separator = '/',
        has_breadcrumbs = true,
        has_line_number = false,
        min_width = 0,
      }
      require('codesnap').setup(opts)
      vim.keymap.set('x', '<leader>cc', '<cmd>\'<,\'>CodeSnap<cr>', { desc = '[C]odeSnap [C]opy' })
      vim.keymap.set('x', '<leader>cs', '<cmd>CodeSnapSave<cr>', { desc = '[C]odeSnap [S]ave' })
    end,
  },
}
