print("Loading plugin theme tokyonight")
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" }
})

require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true
})

vim.cmd([[colorscheme tokyonight]])
