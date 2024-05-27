-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },

  nvdash = {
    load_on_startup = true,

    header = {

      "   ___  __  ________ _____   __   _____  __",
      "  / _ )/ / / / __/ // / _ | / /  /  _/ |/ /",
      " / _  / /_/ /\\ \\/ _  / __ |/ /___/ //    / ",
      "/____/\\____/___/_//_/_/ |_/____/___/_/|_/  ",
      "                                           ",
    },

    buttons = {
      { "  Find File", "<leader> f f", "Telescope find_files" },
      { "󰈚  Recent Files", "<leader> f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "<leader> f w", "Telescope live_grep" },
      { "  Bookmarks", "<leader> m a", "Telescope marks" },
      { "  Themes", "<leader> t h", "Telescope themes" },
      { "  Mappings", "<leader> c h", "NvCheatsheet" },
    },
  },

}

-- M.mappings = require("configs.dap_mappings")

return M
