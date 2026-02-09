-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 0 -- set to 0 to default to tabstop value
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.autocomplete = true

vim.opt.showtabline = 1
