return {
  {
    'Exafunction/codeium.nvim',
    enabled = false,
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('codeium').setup {
        enable_chat = false,
      }
    end,
  },
}
