local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = { "<leader>ff", "<leader>fg" },
    cmd = { "Telescope", "Telescope find_files", "Telescope live_grep", "Telescope buffers", "Telescope help_tags" },
    lazy = true,
    config = function()
      require("core.plugin_configs.telescope")
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    enabled = true,
    config = function()
      require("core.plugin_configs.colorscheme")
    end
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    enabled = true,
    config = function()
      require("core.plugin_configs.colorscheme.init")
    end
  },

  {
    'ThePrimeagen/harpoon',
    config = function()
      require("core.plugin_configs.harpoon")
    end
  },

  {
    'mbbill/undotree',
    keys = { "<leader>u" },
    config = function()
      require("core.plugin_configs.undotree")
    end
  },

  {
    'tpope/vim-fugitive',
    cmd = { "G" },
  },

  {
    'tpope/vim-commentary',
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        config = function()
          require("core.plugin_configs.cmp")
        end
      },                          -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
      require("core.plugin_configs.lsp")
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufWinEnter",
    config = function()
      require("core.plugin_configs.treesitter")
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup()
    end
  },

  {
    "rafamadriz/friendly-snippets",
    event = "BufWinEnter",
    lazy = true
  },

  {
    "bushalin/null-ls.nvim",
    ft = {"js", "html", "yaml", "markdown", "typescript", "typescriptreact", "json", "php" },
    config = function()
      require("core.plugin_configs.null-ls")
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("nvim-autopairs").setup {}
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    event = "VimEnter",
    config = function()
      require("core.plugin_configs.lualine")
    end,
    requires = {
      {
        "kyazdani42/nvim-web-devicons",
      },
    }
  },

  {
    "fatih/vim-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function()
      require("core.plugin_configs.vim-go")
    end,
  },

  {
    'vimwiki/vimwiki',
    event = "BufEnter *.md",
    keys = { "<leader>ww", "<leader>w<leader>w" },
    lazy = true,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/Documents/vimwiki",
          syntax = 'markdown',
          ext = '.md'
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown'
      }
    end,
  }
})
