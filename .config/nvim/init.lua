-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.notermguicolors = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'bushalin.configs.options'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
local lazyconfig = require 'bushalin.configs.lazy_config'

require('lazy').setup({
  -- initialize all the core plugins that we absolutely need
  { import = 'bushalin.plugins.core' },

  -- addon plugins that we can live without but a nice QOL inprovement
  { import = 'bushalin.plugins.addon' },
}, lazyconfig)

vim.schedule(function()
  require 'bushalin.configs.mappings'
  require 'bushalin.configs.autocmds'
  vim.cmd.colorscheme 'gruvbox-material'
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
