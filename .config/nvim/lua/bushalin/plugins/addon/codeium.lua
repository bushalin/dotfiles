return {
  {
    'Exafunction/codeium.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('codeium').setup({
        enable_chat = true
      });
    end,
  },
}
