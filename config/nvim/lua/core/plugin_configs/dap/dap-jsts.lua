local dap = require("dap")
  dap.adapters.lldb = {
    type = 'executable',
    -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
    command = '/usr/bin/lldb-vscode',
    name = "lldb"
  }
  dap.adapters.gdb = {
    type = 'executable',
    -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
    command = '/usr/bin/gdb',
    args = { "--interpreter", "dap" },
    name = "gdb"
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = true,
    },
}
