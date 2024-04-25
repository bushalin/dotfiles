local M = {}
  M.dap = {
    n = {
      ["<leader>db"] = {
        "<cmd> DapToggleBreakpoint <CR>",
        "Add breakpoint at line",
      },
      ["<leader>dr"] = {
        "<cmd> DapContinue <CR>",
        "Start or continue debugger",
      },
    }
  }
return M
