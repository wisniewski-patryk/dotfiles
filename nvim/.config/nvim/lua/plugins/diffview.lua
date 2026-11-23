print("Loading plugin diffview")
vim.pack.add({
    { src = "https://github.com/sindrets/diffview.nvim" }
})

require("diffview").setup({
    hooks = {
        diff_buf_win_enter = function(bufnr, winid, ctx)
            vim.api.nvim_set_option_value("foldenable", false, { win = winid })
        end,
    }
})

vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", With_desc("Open DiffView"))
vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", With_desc("Close DiffView"))
