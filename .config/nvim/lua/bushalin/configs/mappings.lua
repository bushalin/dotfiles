local map = vim.keymap.set

-- General key mappings
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'No highlight search' })
map('n', ';', ':', { desc = 'Enter command mode' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Split navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Insert mode mappings
map('i', 'jj', '<ESC>', { silent = true, desc = 'Go to normal mode' })
map('i', '<C-b>', '<ESC>^i', { desc = 'Move to beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'Move to end of line' })
map('i', '<C-h>', '<Left>', { desc = 'Move left' })
map('i', '<C-l>', '<Right>', { desc = 'Move right' })
map('i', '<C-j>', '<Down>', { desc = 'Move down' })
map('i', '<C-k>', '<Up>', { desc = 'Move up' })

-- Visual mode mappings
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection down' })
map('x', '<leader>p', '"_dP', { desc = 'Paste and keep' })

-- Yank to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
map('n', '<leader>Y', '"+yg', { desc = '[Y]ank to system clipboard' })
map('n', '<leader>yy', '"+yy', { desc = '[Y]ank to system clipboard' })

-- Scrolling and searching
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
map('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- Miscellaneous
map('n', '<leader><cr>', ':noh<cr>', { silent = true, desc = 'Clear search highlights' })
map('n', '<leader>si', ':source %<cr>', { desc = 'Source file' })
map('n', 'dh', ':diffget //2<cr>', { silent = true, desc = 'diffget left' })
map('n', 'dl', ':diffget //3<cr>', { silent = true, desc = 'diffget right' })
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', { desc = 'Change root directory to current' })
map('n', '<BS>', '<C-w>', { desc = 'Shortcut for window' })

-- Tmux integration
map('n', '<localleader>"', '<cmd>!tmux split-window -v<CR>', { desc = '[T]mux [V]ertical' })
map('n', '<localleader>%', '<cmd>!tmux split-window -h<CR>', { desc = '[T]mux [H]orizontal' })
map('n', '<localleader>gf', '<cmd>G<CR>', { desc = '[G]it Fugitive' })
map('n', '<localleader>gl', '<cmd>!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- lazygit <CR><CR>', { desc = '[G]it [L]azy' })
map('n', '<localleader>y', '<cmd>!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- yazi <CR><CR>', { desc = '[Y]azi' })

