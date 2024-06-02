return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>td',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[T]rouble [D]iagnostics toggle',
      },
      {
        '<leader>tD',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[T]rouble buffer [D]iagnostics',
      },
      {
        '<leader>ts',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[T]rouble [S]ymbols',
      },
      {
        '<leader>tl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = '[T]rouble [L]SP diagnostics / references etc',
      },
      {
        '<leader>tL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = '[T]rouble [L]ocation List',
      },
      {
        '<leader>tq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = '[T]rouble [Q]uickfist List',
      },
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
