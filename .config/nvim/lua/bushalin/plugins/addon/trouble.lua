return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<localleader>td',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[T]rouble [D]iagnostics toggle',
      },
      {
        '<localleader>tD',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[T]rouble buffer [D]iagnostics',
      },
      {
        '<localleader>ts',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[T]rouble [S]ymbols',
      },
      {
        '<localleader>tl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = '[T]rouble [L]SP diagnostics / references etc',
      },
      {
        '<localleader>tL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = '[T]rouble [L]ocation List',
      },
      {
        '<localleader>tq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = '[T]rouble [Q]uickfist List',
      },
    },
  },
}
