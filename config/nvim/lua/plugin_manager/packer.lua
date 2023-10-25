vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("core.plugin_configs.telescope")
    end
  }

  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require("core.plugin_configs.gruvbox")
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' },
    config = function()
      require("core.plugin_configs.treesitter")
    end
  }

  use {
    'ThePrimeagen/harpoon',
    config = function()
      require("core.plugin_configs.harpoon.")
    end
  }

  use { 'mbbill/undotree', require("core.plugin_configs.undotree") }

  use('tpope/vim-fugitive')

  use('tpope/vim-commentary')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp', config = function() require("core.plugin_configs.cmp.init") end },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      require("core.plugin_configs.lsp")
    end
  }

  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end
  }

  use {
    "rafamadriz/friendly-snippets"
  }

  use {
    "bushalin/null-ls.nvim",
    config = function()
      require("core.plugin_configs.null-ls")
    end
  }


  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require("core.plugin_configs.lualine.init")
    end
  }

  use {
    'vimwiki/vimwiki',
    config = function()
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
    end
  }

  use {
    "fatih/vim-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function()
      require("core.plugin_configs.vim-go")
    end,
  }

end)
