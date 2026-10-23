print("Loading vim options")
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

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
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

vim.opt.autocomplete = true

vim.opt.showtabline = 1

vim.opt.scrolloff = 10
vim.opt.numberwidth = 5

vim.g.editorconfig = true

vim.opt.cmdheight = 1

-- smart folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- vim.opt.foldcolumn = '1'
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local ok, _ = pcall(vim.treesitter.get_parser, 0)
        if ok then
            vim.opt_local.foldmethod = 'expr'
            vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        else
            vim.opt_local.foldmethod = 'indent'
        end
    end,
})
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
