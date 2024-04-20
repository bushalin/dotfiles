local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end
 
require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
local dap = require('dap')
dap.adapters.executable = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
  name = 'lldb1',
  host = '127.0.0.1',
  port = 13000
}
dap.adapters.lldb = {
  name = "codelldb server",
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },
  }
}
dap.adapters.gdb = {
  type = 'executable',
  command = '/usr/bin/gdb',
  args = { "--interpreter", "dap" },
  name = "gdb"
}
require 'mason-nvim-dap'.setup_handlers {
    function(source_name)
        -- all sources with no handler get passed here


        -- Keep original functionality of `automatic_setup = true`
        require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    codelldb = function(source_name)
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = true,
            }
        }
    end,
}
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "lldb",
--     request = "launch",
--     -- program = function()
--     --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     -- end,
--     program = '${workspaceFolder}/build/bin/AWL_ENGINE_AGENT',
--     cwd = '${workspaceFolder}',
--     stopAtEntry = true,
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'cppdbg',
--     request = 'launch',
--     MIMode = 'gdb',
--     miDebuggerServerAddress = 'localhost:1234',
--     miDebuggerPath = '/usr/bin/gdb',
--     cwd = '${workspaceFolder}',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--   },
-- } 

