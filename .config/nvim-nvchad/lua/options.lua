require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

opt.guicursor = ""

o.cursorline = true
o.cursorlineopt = 'line' -- to enable cursorline!

o.number = true
o.relativenumber = true

opt.inccommand = "nosplit"
opt.incsearch = true

opt.scrolloff = 8
