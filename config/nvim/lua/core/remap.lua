vim.keymap.set("n", "<leader>w", ":w!<cr>", { silent = true })
vim.keymap.set("n", "<leader><cr>", ":noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>si", ":source %<cr>", { silent = false })

vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "dh", ":diffget //2<cr>", { silent = true })
vim.keymap.set("n", "dl", ":diffget //3<cr>", { silent = true })

-- double click jj to revert back to normal mode
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- copy to the clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
vim.keymap.set("n", "<C-w>m", "<C-w>|<C-w>_")

vim.keymap.set("n", "<leader>vs", ":vs<cr><C-W>l")
vim.keymap.set("n", "<leader>sp", ":sp<cr><C-W>j")

vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

vim.cmd([[autocmd FileType c,cpp,go setlocal shiftwidth=4 softtabstop=4 expandtab]])
vim.cmd([[autocmd FileType lua,javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]])

-- remaps from the primeage
-- move selected files in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeps the cursor in the middle when scrolling and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keeping the paste in the buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
