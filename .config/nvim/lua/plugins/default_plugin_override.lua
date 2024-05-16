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
    "nvim-treesitter/nvim-treesitter",
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
