local o = vim.o
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

o.wrap = true
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')
vim.opt.whichwrap:append('<')
vim.opt.whichwrap:append('>')
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
vim.opt.updatetime = 250




opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.scrolloff = 12
opt.signcolumn = "yes"

opt.backspace = { "start", "eol", "indent" }

opt.splitright = true
opt.splitbelow = true

vim.cmd [[colorscheme catppuccin-mocha]]
opt.clipboard = 'unnamedplus'


