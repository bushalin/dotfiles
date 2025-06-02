-- Create augroups for better organization
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Autocmd for common filetypes
augroup('filetype_settings', { clear = true })
autocmd('FileType', {
  group = 'filetype_settings',
  pattern = 'go',
  command = 'setlocal shiftwidth=8 softtabstop=8 expandtab',
})
autocmd('FileType', {
  group = 'filetype_settings',
  pattern = 'c,cpp',
  command = 'setlocal shiftwidth=2 softtabstop=2 expandtab',
})
autocmd('FileType', {
  group = 'filetype_settings',
  pattern = 'lua,javascript,typescript,typescriptreact',
  command = 'setlocal shiftwidth=2 softtabstop=2 expandtab',
})
autocmd('FileType', {
  group = 'filetype_settings',
  pattern = 'markdown',
  command = 'setlocal conceallevel=2',
})

-- Autocmd for db (vim-dadbod)
augroup('db_settings', { clear = true })
autocmd('FileType', {
  group = 'db_settings',
  pattern = 'sql,mysql,plsql',
  callback = function()
    require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
  end,
})

-- Go to the last edited position when opening a buffer
autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Highlight when yanking (copying) text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Easy navigation in terminals
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
autocmd('TermOpen', {
  pattern = 'term://*',
  callback = _G.set_terminal_keymaps,
})
