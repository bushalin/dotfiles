return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile', 'BufEnter' },
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      -- return '%2l:%-2v'
      -- end

      require('mini.splitjoin').setup()

      require('mini.starter').setup {
        items = nil,
        header = [[
   ___  __  ________ _____   __   _____  __
  / _ )/ / / / __/ // / _ | / /  /  _/ |/ /
 / _  / /_/ /\ \/ _  / __ |/ /___/ //    / 
/____/\____/___/_//_/_/ |_/____/___/_/|_/  
        ]],
     --    footer = [[
     --        _   _
     --       (.)_(.)
     --    _ (   _   ) _
     --   / \/`-----'\/ \
     -- __\ ( (     ) ) /__
     -- )   /\ \._./ /\   (
     --  )_/ /|\   /|\ \_(
     --    ]]
        footer = [[
         />_________________________________
[########[]_________________________________>
         \>
        ]]
      }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
