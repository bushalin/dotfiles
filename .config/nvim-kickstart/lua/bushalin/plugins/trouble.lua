return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = { '<leader>tt', '<leader>tw','<leader>td', '<leader>tq', 'gR' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      vim.keymap.set('n', '<leader>tt', function()
        require('trouble').toggle()
      end, { desc = '[T]rouble [T]oggle' })
      vim.keymap.set('n', '<leader>tw', function()
        require('trouble').toggle 'workspace_diagnostics'
      end, { desc = '[T]rouble [W]orkspace_diagnostics' })
      vim.keymap.set('n', '<leader>td', function()
        require('trouble').toggle 'document_diagnostics'
      end, { desc = '[T]rouble [D]ocument_diagnostics' })
      vim.keymap.set('n', '<leader>tq', function()
        require('trouble').toggle 'quickfix'
      end, { desc = '[T]rouble [Q]uickfix' })
      vim.keymap.set('n', '<leader>tl', function()
        require('trouble').toggle 'loclist'
      end, { desc = '[T]rouble [L]oclist' })
      vim.keymap.set('n', 'gR', function()
        require('trouble').toggle 'lsp_references'
      end, { desc = '[T]rouble lsp [R]eferences' })
    end,
  },
}
