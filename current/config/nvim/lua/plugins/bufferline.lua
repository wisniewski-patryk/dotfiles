vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim" },
})

require("bufferline").setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer", -- Text shown above the offset
                text_align = "left",    -- "left" | "center" | "right"
                separator = true        -- Adds a vertical line between offset and tabs
            },
        },
        indicator = {
            icon = '📌', 
            style = 'icon',
        },
    -- Other options...
    diagnostics = "nvim_lsp",
    }
})
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bN', ':bp<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bx', ':bp|bd #<CR>', { desc = 'Close Buffer' })

