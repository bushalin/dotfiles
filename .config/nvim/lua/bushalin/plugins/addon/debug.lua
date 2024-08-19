---@diagnostic disable: missing-fields
-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)
-- :h dap-configuration

return {
  'mfussenegger/nvim-dap',
  lazy = true,
  cmd = { 'DapContinue' },
  keys = { '<localleader>dc' },
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- adds virtual text for nvim-dap
    'theHamsta/nvim-dap-virtual-text',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'cpptools',
        'codelldb',
      },
    }

    -- setup virtual text for nvim-dap
    require('nvim-dap-virtual-text').setup {
      commented = true,
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<localleader>dcc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<localleader>di', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<localleader>do', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<localleader>dt', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<localleader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<localleader>dcb', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('nvim-dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }

    -- NOTE: C++ adapters
    -- GDB native
    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '-i', 'dap' },
    }
    -- dap.adapters.lldb = {
    --   type = 'executable',
    --   command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    --   name = 'lldb',
    -- }

    -- NOTE: C++ Configuration

    -- gdb
    dap.configurations.cpp = {
      {
        name = 'Launch GDB',
        type = 'gdb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
    }

    -- lldb
    -- dap.configurations.cpp = {
    --   {
    --     name = 'Launch LLDB',
    --     type = 'lldb',
    --     request = 'launch',
    --     program = function()
    --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --     args = {},
    --
    --     -- 💀
    --     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --     --
    --     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --     --
    --     -- Otherwise you might get the following error:
    --     --
    --     --    Error on launch: Failed to attach to the target process
    --     --
    --     -- But you should be aware of the implications:
    --     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    --     -- runInTerminal = false,
    --   },
    -- }
  end,
}
