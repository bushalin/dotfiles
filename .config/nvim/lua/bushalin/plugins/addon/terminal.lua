return {
  {
    -- amongst your other plugins
    {
      'akinsho/toggleterm.nvim',
      enabled = false,
      version = '*',
      config = true,
    },
  },
  {
    'ryanmsnyder/toggleterm-manager.nvim',
    enabled = false,
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
    },
    config = false,
  },
}
