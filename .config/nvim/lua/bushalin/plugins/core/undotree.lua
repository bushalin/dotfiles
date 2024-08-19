return {
  {
    'mbbill/undotree',
    keys = { '<localleader>u' },
    config = function()
      vim.keymap.set('n', '<localleader>u', vim.cmd.UndotreeToggle)
    end,
  },
}
