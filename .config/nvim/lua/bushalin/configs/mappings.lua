local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set : to enter command mode
map('n', ';', ':')

-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('i', 'jk', '<ESC>', { silent = true, desc = 'Go to normal mode' })

-- save file in any mode
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map('n', '<leader><cr>', ':noh<cr>', { silent = true })
map('n', '<leader>si', ':source %<cr>', { silent = false, desc = 'Source file' })

-- vim fugitive related
-- WARN: REMOVE WITH CAUTION
map('n', 'dh', ':diffget //2<cr>', { silent = true, desc = 'diffget left' })
map('n', 'dl', ':diffget //3<cr>', { silent = true, desc = 'diffget right' })

-- copy to the clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
-- map('n', '<C-w>m', '<C-w>|<C-w>_', { desc = 'Maximize buffer' })

map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', { desc = 'Change root directory to current' })

-- remaps from the primeage
-- move selected files in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection down' })

-- keeps the cursor in the middle when scrolling and searching
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- remaps for copy to the system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
map('n', '<leader>Y', '"+yg', { desc = '[Y]ank to system clipboard' })
map('n', '<leader>yy', '"+yy', { desc = '[Y]ank to system clipboard' })
-- Some cool info about the registers:
-- default register is " register
-- yank register is 0 register
-- when you yank/delete something
-- it will go to the default " register
-- but the 0 register will hold the latest yank
-- so you can do:
-- yank something => will go to the 0 register
-- delete something => will go to " register
-- then you can paste from 0 register
-- ex:
--
-- yank some text -> yy
-- delete the text you want to replace -> dd
-- paste using the 0 register -> "0p
--
-- You can do <C-r>(register_name) to paste
-- into the command

-- keeping the paste in the buffer
map('x', '<leader>p', '"_dP', { desc = 'Paste and keep' })

-- Easier control in insert mode
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

map('n', '<BS>', '<C-w>', { desc = 'Shortcut for window'})

-- Keymapping to enable git
map('n', '<localleader>g', '<cmd>G<CR>', { desc = '[G]it Fugitive' })
