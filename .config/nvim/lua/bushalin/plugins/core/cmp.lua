return {
  {
    'hrsh7th/nvim-cmp',
    enabled = false,
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            lazy = true,
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      luasnip.config.setup {}
      lspkind.init {
        mode = 'symbol_text',
        preset = 'default',
        symbol_map = {
          Text = '󰉿',
          Method = '󰆧',
          Function = '󰊕',
          Constructor = '',
          Field = '󰜢',
          Variable = '󰀫',
          Class = '󰠱',
          Interface = '',
          Module = '',
          Property = '󰜢',
          Unit = '󰑭',
          Value = '󰎠',
          Enum = '',
          Keyword = '󰌋',
          Snippet = '',
          Color = '󰏘',
          File = '󰈙',
          Reference = '󰈇',
          Folder = '󰉋',
          EnumMember = '',
          Constant = '󰏿',
          Struct = '󰙅',
          Event = '',
          Operator = '󰆕',
          TypeParameter = '',
          Codeium = '',
          Copilot = '',
        },
      }
      vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match '^%s*$' == nil
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          -- ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<Tab>'] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              fallback()
            end
          end),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              vim.api.nvim_input '<Right>'
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              vim.api.nvim_input '<Left>'
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'copilot' },
          { name = 'codeium' },
          { name = 'luasnip' },
          { name = 'path' },
          {
            name = 'buffer',
            option = {
              keyword_length = 5,
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 100,
            ellipsis_char = '...',
          },
        },
      }

      -- Experimental cmdline setup (commented out)
      -- cmp.setup.cmdline('/', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = { { name = 'buffer' } },
      -- })
      -- cmp.setup.cmdline(':', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = { { name = 'path' } },
      -- })
    end,
  },
}
