local options = {
  event = { "BufReadPre", "BufNewFile" },

  linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    php = { "eslint_d" },
    html = { "eslint_d" },
    css = { "eslint_d" },
    cpp = { "eslint_d" },
  },
}

require("nvim-lint").setup(options)
