vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    view = {
        width=35,
        side="left"
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
    end,
})

-- Toggle nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
-- Focus nvim-tree
vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "Focus File Explorer" })

