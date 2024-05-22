local map = vim.keymap.set
local trouble = require("trouble")

map("n", "<leader>tt", function() trouble.toggle() end, { desc = "Trouble Toggle" })
map("n", "<leader>tw", function() trouble.toggle("workspace_diagnostics") end,
  { desc = "Trouble workspace_diagnostics" })
map("n", "<leader>td", function() trouble.toggle("document_diagnostics") end,
  { desc = "Trouble document_diagnostics" })
map("n", "<leader>tq", function() trouble.toggle("quickfix") end, { desc = "Trouble quickfix" })
map("n", "<leader>tl", function() trouble.toggle("loclist") end, { desc = "Trouble loclist" })
map("n", "gR", function() trouble.toggle("lsp_references") end, { desc = "Trouble lsp_references" })
