local plugins = {

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cpp" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        -- { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      }
    }
  },
}

return plugins
