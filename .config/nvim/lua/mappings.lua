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


-- copy to the clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")

-- maximize the window
map("n", "<C-w>m", "<C-w>|<C-w>_", { desc = "Maximize buffer" })

-- map("n", "<leader>vs", ":vs<cr><C-W>l")
-- map("n", "<leader>sp", ":sp<cr><C-W>j")

map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", { desc = "Change root directory to current" })

-- autocmd for common filetypes
vim.cmd([[autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab]])
vim.cmd(
  [[autocmd FileType c, cpp, lua,javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]])

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("bushalin-hightlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- remaps from the primeage
-- move selected files in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up"})
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down"})

-- keeps the cursor in the middle when scrolling and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keeping the paste in the buffer
map("x", "<leader>p", "\"_dP", { desc = "Paste and keep" })

-- git related remaps
local gitsigns = require('gitsigns')

map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = "Git next hunk" })
map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = "Git previous hunk" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Actions
map('n', '<leader>ggs', gitsigns.stage_hunk, { desc = "Git stage hunk" })
map('n', '<leader>ggr', gitsigns.reset_hunk, { desc = "Git reset hunk" })
map('v', '<leader>ggs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('v', '<leader>ggr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('n', '<leader>ggS', gitsigns.stage_buffer, { desc = "Git Stage buffer" })
map('n', '<leader>ggu', gitsigns.undo_stage_hunk, { desc = "Git undo-stage hunk" })
map('n', '<leader>ggR', gitsigns.reset_buffer, { desc = "Git Reset buffer" })
map('n', '<leader>ggp', gitsigns.preview_hunk, { desc = "Git preview hunk" })
-- map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end)
map('n', '<leader>tgb', gitsigns.toggle_current_line_blame, { desc = "Git toggle current line blame" })
map('n', '<leader>ggd', gitsigns.diffthis, { desc = "Git diff this" })
map('n', '<leader>ggD', function() gitsigns.diffthis('~') end, { desc = "Git diff this Selection" })
map('n', '<leader>tgd', gitsigns.toggle_deleted, { desc = "Git toggle deleted" })

map('n', '<leader>tx', function() require("trouble").toggle() end, { desc = "Trouble Toggle"})
map("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble workspace_diagnostics"})
map("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble document_diagnostics"})
map("n", "<leader>tq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble quickfix"})
map("n", "<leader>tl", function() require("trouble").toggle("loclist") end, { desc = "Trouble loclist"})
map("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble lsp_references"})
