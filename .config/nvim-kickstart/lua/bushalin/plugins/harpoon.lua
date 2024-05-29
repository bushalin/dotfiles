return {
  {
    'ThePrimeagen/harpoon',
    event = { 'BufReadPre', 'BufNewFile', 'BufEnter' },
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    keys = {},
    config = function()
      vim.keymap.set('n', '<leader>he', function() require('harpoon.ui').toggle_quick_menu() end, { desc = '[H]arpoon [E]xplore'})
      vim.keymap.set('n', '<leader>ha', function() require('harpoon.mark').add_file() end, { desc = '[H]arpoon [A]dd file'})
    end
  },
}
