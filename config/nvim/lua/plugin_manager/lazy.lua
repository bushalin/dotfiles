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

  --------------Colorscheme and editor beauty -------------
  {
    'ellisonleao/gruvbox.nvim',
    priority = 49,
    lazy = false,
    enabled = true,
    config = function()
      require("core.plugin_configs.colorscheme.gruvbox")
    end
  },

  {
    'rebelot/kanagawa.nvim',
    enabled = true,
    config = function()
      require("core.plugin_configs.colorscheme.kanagawa")
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
  --------------Colorscheme and editor beauty -------------


  --------------LSP related Plugins-------------
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
      {
        'L3MON4D3/LuaSnip',
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        dependencies = { "rafamadriz/friendly-snippets" },

        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
          require("core.plugin_configs.luasnip")
        end
      },
    },
    config = function()
      require("core.plugin_configs.lsp")
    end
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
    "bushalin/null-ls.nvim",
    ft = { "js", "html", "yaml", "markdown", "typescript", "typescriptreact", "json", "php" },
    config = function()
      require("core.plugin_configs.null-ls")
    end
  },

  --------------LSP related Plugins-------------

  --------------DEBUG ADAPTER PROTOCOL RELATED-------------
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.plugin_configs.dap.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require("core.plugin_configs.dap.dap-ui")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function()
      require("core.plugin_configs.dap.dap-go")
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = "VeryLazy",
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      handlers = {}
    }
  },
  --------------DEBUG ADAPTER PROTOCOL RELATED-------------

  --------------Text editor configuration-------------
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufWinEnter",
    config = function()
      require("core.plugin_configs.treesitter")
    end,
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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  --------------Text editor configuration-------------

  --------------misc-------------
  {
    'Civitasv/cmake-tools.nvim',
    dependencides = {
      "nvim-lua/plenary.nvim" 
    },
    config = function()
      require("cmake-tools").setup {}
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
    "rafamadriz/friendly-snippets",
    event = "BufWinEnter",
    lazy = true
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- {
  --   "fatih/vim-go",
  --   ft = { "go", "gomod", "gowork", "gotmpl" },
  --   config = function()
  --     require("core.plugin_configs.vim-go")
  --   end,
  -- },

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
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
  --------------misc-------------

})
