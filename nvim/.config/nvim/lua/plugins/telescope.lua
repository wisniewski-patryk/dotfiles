vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' }
})

require("telescope").setup({
    defaults = {},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, With_desc("Telescope Find Files"))
vim.keymap.set("n", "<leader>fg", builtin.live_grep, With_desc("Telescope Live Grep"))
vim.keymap.set("n", "<leader>fb", builtin.buffers, With_desc("Telescope Buffers"))
vim.keymap.set("n", "<leader>fh", builtin.help_tags, With_desc("Telescope Help Tags"))

