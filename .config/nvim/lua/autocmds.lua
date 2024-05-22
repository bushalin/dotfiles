-- autocmd for common filetypes
vim.cmd([[autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab]])
vim.cmd([[autocmd FileType c, cpp setlocal shiftwidth=4 softtabstop=4 expandtab]])
vim.cmd(
  [[autocmd FileType lua,javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]])

-- autocmd for db (vim-dadbod)
vim.cmd(
  [[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]])

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("bushalin-hightlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
