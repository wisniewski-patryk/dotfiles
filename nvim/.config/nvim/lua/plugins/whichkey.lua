print("Loading plugin whichkey")
vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
    preset = "helix"
})

local function show_whichkey()
    vim.cmd("WhichKey")
end

vim.keymap.set('n', '<A-Space>', show_whichkey, With_desc('Show idle menu'))
