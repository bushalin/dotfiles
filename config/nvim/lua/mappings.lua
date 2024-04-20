require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>w", ":w!<cr>", { silent = true })
map("n", "<leader><cr>", ":noh<cr>", { silent = true })
map("n", "<leader>si", ":source %<cr>", { silent = false })

map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

map("n", "dh", ":diffget //2<cr>", { silent = true })
map("n", "dl", ":diffget //3<cr>", { silent = true })

-- double click jj to revert back to normal mode
-- map("i", "jj", "<ESC>", { silent = true })

-- copy to the clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
map("n", "<C-w>m", "<C-w>|<C-w>_")

-- map("n", "<leader>vs", ":vs<cr><C-W>l")
-- map("n", "<leader>sp", ":sp<cr><C-W>j")

map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

vim.cmd([[autocmd FileType c,cpp,go setlocal shiftwidth=2 softtabstop=2 expandtab]])
vim.cmd([[autocmd FileType lua,javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]])

-- remaps from the primeage
-- move selected files in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keeps the cursor in the middle when scrolling and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keeping the paste in the buffer
map("x", "<leader>p", "\"_dP")
