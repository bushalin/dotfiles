return {
  {
    'Exafunction/codeium.vim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    event = { 'BufRead', 'BufNewFile' },
    -- config = function()
    --   vim.keymap.set('i', '<C-g>', function()
    --     return vim.fn['codeium#Accept']
    --   end, { expr = true, silent = true })
    --   -- set a keymap to cycle through codeium suggestions
    --   vim.keymap.set('i', '<C-,>', function()
    --     return vim.fn['codeium#Complete()']
    --   end, { expr = true, silent = true })
    -- end,
  },
}
