vim.g.mapleader = ","
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.opt.guicursor = ""

vim.o.syntax = 'on'

vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.filetype = 'on'
vim.opt.filetype.plugin = 'on'
vim.opt.filetype.indent = 'on'

vim.opt.encoding = 'utf-8'

vim.opt.showmatch = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.mouse = 'a'
vim.opt.wildmenu = true

vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.hid = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.mat = 2

vim.g.noerrorbells = true
vim.g.novisualbell = true

vim.g.tm = 500
vim.g.foldcolumn = 1
vim.g.history = 500
vim.g.autoread = true
vim.g.laststatus = 2

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.g.nocompatible = true
vim.g.wildignorecase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
