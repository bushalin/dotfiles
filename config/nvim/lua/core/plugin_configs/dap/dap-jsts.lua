local dap = require("dap")
require("dapui").setup()
require("mason-nvim-dap").setup({
    automatic_setup = true,
})

dap.adapters.executable = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
  name = 'lldb1',
  host = '127.0.0.1',
  port = 13000
}

dap.adapters.codelldb = {
  name = "codelldb server",
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },
  }
}


require 'mason-nvim-dap'.setup_handlers {
    -- function(source_name)
    --     -- all sources with no handler get passed here


    --     -- Keep original functionality of `automatic_setup = true`
    --     require('mason-nvim-dap.automatic_setup')(source_name)
    -- end,
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
