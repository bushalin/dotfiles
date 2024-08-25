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

      -- NOTE:
      -- split/join paramteres in a fucntion
      require('mini.splitjoin').setup()

      -- NOTE:
      -- Startup screen
      -- local starter = require 'mini.starter'
      -- starter.setup {
      --   evaluate_single = true,
      --   header = [[
      --    ___  __  ________ _____   __   _____  __
      --   / _ )/ / / / __/ // / _ | / /  /  _/ |/ /
      --  / _  / /_/ /\ \/ _  / __ |/ /___/ //    /
      -- /____/\____/___/_//_/_/ |_/____/___/_/|_/
      --         ]],
      --   items = {
      --     starter.sections.builtin_actions(),
      --     starter.sections.recent_files(10, false),
      --     starter.sections.recent_files(5, true),
      --     starter.sections.telescope(),
      --   },
      --   content_hooks = {
      --     starter.gen_hook.adding_bullet(),
      --     starter.gen_hook.indexing('all', { 'Builtin actions' }),
      --     starter.gen_hook.aligning('center', 'center'),
      --     starter.gen_hook.padding(3, 2),
      --   },
      -- }
    end,
  },
}
