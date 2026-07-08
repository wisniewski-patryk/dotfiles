vim.pack.add({
    { src = "https://github.com/mistweaverco/bafa.nvim" }
})

require("bafa").setup()

vim.keymap.set("n", "<leader>b", function() require("bafa").toggle() end, { desc = "Toggle bafa floating buffers" })
