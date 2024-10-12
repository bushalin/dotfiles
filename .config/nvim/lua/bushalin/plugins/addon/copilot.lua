return {
  {
    'zbirenbaum/copilot.lua',
    enabled = false,
    cmd = 'Copilot',
    event = 'InsertEnter',
    lazy = true,
    config = function()
      local cmp = require 'cmp'
      require('copilot').setup {
        panel = {
          auto_refresh = true,
          auto_close = true,
        },
        suggestion = {
          auto_trigger = true,
        },

        -- keybindings for copilot
        vim.keymap.set('i', '<C-y>', require('copilot.suggestion').accept, { silent = true }),
        vim.keymap.set('i', '<C-e>', require('copilot.suggestion').dismiss, { silent = true }),
        vim.keymap.set('i', '<C-j>', require('copilot.suggestion').next, { silent = true }),
        vim.keymap.set('i', '<C-k>', require('copilot.suggestion').prev, { silent = true }),
        -- trigger copilot suggestion manually with <C-space>
        vim.keymap.set('i', '<C-Space>', require('copilot.suggestion').toggle_auto_trigger, { silent = true }),

        -- hide copilot when cmp menu is open and show when closed
        cmp.event:on('menu_opened', function()
          vim.b.copilot_suggestion_hidden = true
        end),

        cmp.event:on('menu_closed', function()
          vim.b.copilot_suggestion_hidden = false
        end),

        -- disallow copilot for specific filetypes
        filetypes = {
          markdown = true, -- overrides default
          terraform = false, -- disallow specific filetype
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
              -- disable for .env files
              return false
            end
            return true
          end,
        },
      }
    end,
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = false,
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
