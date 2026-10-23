print("Loading plugin diffview")
vim.pack.add({
    { src = "https://github.com/sindrets/diffview.nvim" }
})

require("diffview")

vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", With_desc("Open DiffView"))
vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", With_desc("Close DiffView"))
