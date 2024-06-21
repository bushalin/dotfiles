return {
  {
    'ThePrimeagen/harpoon',
    event = { 'BufReadPre', 'BufNewFile', 'BufEnter' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      lazy = true,
    },
    keys = {},
    config = function()
      local harpoon = require 'harpoon'
      local harpoon_ui = require 'harpoon.ui'
      local harpoon_mark = require 'harpoon.mark'
      harpoon.setup {
        menu = {
          width = vim.api.nvim_win_get_width(0) - 50,
        },
      }
      vim.keymap.set('n', '<leader>hl', function()
        harpoon_ui.toggle_quick_menu()
      end, { desc = '[H]arpoon [L]ist marks' })

      vim.keymap.set('n', '<leader>hn', function()
        harpoon_ui.nav_next()
      end, { desc = '[H]arpoon navigate [N]ext' })
      vim.keymap.set('n', '<leader>hp', function()
        harpoon_ui.nav_prev()
      end, { desc = '[H]arpoon navigate [N]ext' })
      vim.keymap.set('n', '<leader>h1', function()
        harpoon_ui.nav_file(1)
      end, { desc = '[H]arpoon navigate file [1]' })
      vim.keymap.set('n', '<leader>h2', function()
        harpoon_ui.nav_file(2)
      end, { desc = '[H]arpoon navigate file [2]' })
      vim.keymap.set('n', '<leader>h3', function()
        harpoon_ui.nav_file(3)
      end, { desc = '[H]arpoon navigate file [3]' })
      vim.keymap.set('n', '<leader>h4', function()
        harpoon_ui.nav_file(4)
      end, { desc = '[H]arpoon navigate file [4]' })
      vim.keymap.set('n', '<leader>h5', function()
        harpoon_ui.nav_file(5)
      end, { desc = '[H]arpoon navigate file [5]' })

      vim.keymap.set('n', '<leader>ha', function()
        harpoon_mark.add_file()
      end, { desc = '[H]arpoon [A]dd file' })
    end,
  },
}
