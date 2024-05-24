local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { silent = true, desc = "Go to normal mode" })

-- save file in any mode
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader><cr>", ":noh<cr>", { silent = true })
map("n", "<leader>si", ":source %<cr>", { silent = false, desc = "Source file" })

-- vim fugitive related
-- REMOVE WITH CAUTION
-- map("n", "dh", ":diffget //2<cr>", { silent = true, desc = "diffget left" })
-- map("n", "dl", ":diffget //3<cr>", { silent = true, desc = "diffget right" })

-- copy to the clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
map("n", "<C-w>m", "<C-w>|<C-w>_", { desc = "Maximize buffer" })

map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", { desc = "Change root directory to current" })

-- remaps from the primeage
-- move selected files in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- keeps the cursor in the middle when scrolling and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- remaps for copy to the system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y')
map('n', '<leader>Y', '"+yg')
map('n', '<leader>yy', '"+yy')
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
map("x", "<leader>p", "\"_dP", { desc = "Paste and keep" })
