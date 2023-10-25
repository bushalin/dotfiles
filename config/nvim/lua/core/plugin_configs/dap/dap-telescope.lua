require('telescope').load_extension('dap')

vim.keymap.set('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
vim.keymap.set('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
vim.keymap.set('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
vim.keymap.set('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
vim.keymap.set('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
