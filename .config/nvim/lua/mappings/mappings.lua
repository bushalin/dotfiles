require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set


map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map("n", "<leader>w", ":w!<cr>", { silent = true, desc = "Save a file" })
map("n", "<leader><cr>", ":noh<cr>", { silent = true })
map("n", "<leader>si", ":source %<cr>", { silent = false, desc = "Source file" })


map("n", "dh", ":diffget //2<cr>", { silent = true, desc = "diffget left" })
map("n", "dl", ":diffget //3<cr>", { silent = true, desc = "diffget right" })

map("i", "jk", "<ESC>", { silent = true, desc = "Go to normal mode" })

-- copy to the clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
map("n", "<C-w>m", "<C-w>|<C-w>_", { desc = "Maximize buffer" })

-- map("n", "<leader>vs", ":vs<cr><C-W>l")
-- map("n", "<leader>sp", ":sp<cr><C-W>j")

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

-- keeping the paste in the buffer
map("x", "<leader>p", "\"_dP", { desc = "Paste and keep" })


vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("mappings.gitsigns")
require("mappings.trouble")
