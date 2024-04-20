local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" }
})
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.after.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.after.event_exited["dapui_config"] = function()
--   dapui.close()
-- end


vim.keymap.set('n', '<leader>dui', '<cmd> lua require("dapui").toggle()<CR>')
