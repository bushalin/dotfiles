return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = true,
    lazy = true,
    cmd = 'CopilotChat',
    keys = {
      { '<leader>ct', ':CopilotChatToggle<cr>', { desc = 'Copilot Chat Toggle' } },
    },
    branch = 'main',
    dependencies = {
      { 'github/copilot.vim' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      chat_autocomplete = true,
      auto_insert_mode = false,
      window = {
        layout =  'vertical',
        width = 0.5,
        border = {
          style = 'rounded',
          text = {
            top = ' Copilot Chat ',
            top_align = 'left'
          }
        }
      }
      -- See Configuration section for rest
    },
    -- -- See Commands section for default commands if you want to lazy load on them
    -- config = function()
    --   local copilot = require('copilot')
    --   require('CopilotChat').setup {
    --     -- keybindings for copilot chat
    --     vim.keymap.set('n', '<leader>gcm', '<cmd>CopilotChatCommitStaged<CR>', { silent = true }),
    --   }
    -- end,
  },
}
