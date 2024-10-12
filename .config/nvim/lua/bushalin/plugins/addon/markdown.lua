return {
  {
    'serenevoid/kiwi.nvim',
    enabled = false,
    ft = '.md',
    event = 'BufEnter *.md',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      {
        name = 'work',
        path = '/Users/hasibulhasan/Documents/Work/Projects',
      },
      {
        name = 'personal',
        path = '/Users/hasibulhasan/Documents/vimwiki',
      },
    },
    keys = {
      { '<localleader>ww', ':lua require("kiwi").open_wiki_index()<cr>', desc = 'Open Wiki index' },
      { '<localleader>wp', ':lua require("kiwi").open_wiki_index("personal")<cr>', desc = 'Open index of personal wiki' },
      { 'T', ':lua require("kiwi").todo.toggle()<cr>', desc = 'Toggle Markdown Task' },
    },
    lazy = true,
  },

  {
    'lukas-reineke/headlines.nvim',
    enabled = false,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true, -- or `opts = {}`
  },

  {
    -- Better bullet points for markdown
    'bullets-vim/bullets.vim',
    enabled = false,
    ft = 'markdown',
    event = 'BufEnter *.md',
  },

  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    enabled = false,
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'hedyhli/outline.nvim',
    ft = '.md',
    enabled = false,
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}
