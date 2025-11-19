local o = vim.o
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

o.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.backspace = {"start", "eol", "indent"}

opt.splitright = true
opt.splitbelow = true

vim.cmd[[colorscheme catppuccin-latte]]
opt.backspace = 'indent,eol,start' 
opt.clipboard = 'unnamedplus'
