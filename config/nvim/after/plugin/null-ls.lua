local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd.with({
      extra_args = { "no-semi", "--single-quote", "--jsx-single-quote" },
      filetypes = { "html", "yaml", "markdown", "typescript", "typescriptreact", "json", "php" },
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    }),
    --null_ls.builtins.formatting.clang_format,
  },
})

vim.cmd([[autocmd FileType lua autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType typescript autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType yaml autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType yml autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType typescriptreact autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType php autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType cpp autocmd BufWritePre * lua vim.lsp.buf.format()]])
