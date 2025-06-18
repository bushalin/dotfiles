return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = true,
    lazy = true,
    cmd = 'CopilotChat',
    branch = 'main',
    dependencies = {
      { 'github/copilot.vim' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
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
