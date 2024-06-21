return {
  { -- You can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
    opts = {
      style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = false, -- Enable this to disable setting the background color
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = 'dark', -- style for sidebars, see below
        floats = 'dark', -- style for floating windows
      },
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    },
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'

      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    {
      'catppuccin/nvim',
      lazy = true,
      keys = {
        {
          '<leader>ft',
          '<CMD>Telescope colorscheme<CR>',
          desc = '[F]ind [T]heme by lazy loading',
        },
      },
      name = 'catppuccin',
      opts = {
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- disables setting the background color.
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      },
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    config = true,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = 'soft', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
    init = function()
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'savq/melange-nvim',
    name = 'melange',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'rebelot/kanagawa.nvim',
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    'christianchiarulli/nvcode-color-schemes.vim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'comfysage/evergarden',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'glepnir/zephyr-nvim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'ray-x/starry.nvim',
    lazy = true,
    enabled = false,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'lewpoly/sherbet.nvim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'Mofiqul/adwaita.nvim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'Yazeed1s/oh-lucy.nvim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },

  {
    'mellow-theme/mellow.nvim',
    lazy = true,
    keys = {
      {
        '<leader>ft',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[F]ind [T]heme by lazy loading',
      },
    },
  },
}
