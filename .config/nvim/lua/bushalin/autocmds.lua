-- autocmd for common filetypes
vim.cmd [[autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab]]
vim.cmd [[autocmd FileType c, cpp setlocal shiftwidth=4 softtabstop=4 expandtab]]
vim.cmd [[autocmd FileType lua,javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]]

-- autocmd for db (vim-dadbod)
vim.cmd [[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]

-- Go to the last edited position when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
