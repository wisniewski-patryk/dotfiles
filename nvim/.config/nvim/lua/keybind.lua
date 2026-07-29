print("Loading keybindings")

print("Mapping leader")
vim.g.mapleader = " "

print("Add Config reloading")
local function reloadConfig()
    vim.cmd("source $MYVIMRC")
    print("Config reloaded!")
end

local opts = { silent = true }
vim.keymap.set("n", "<leader><leader>r", reloadConfig,   With_desc("Reload Config", opts))
vim.keymap.set('n', '<leader><tab>',   ':bnext<CR>',     With_desc("Next buffer", opts))
vim.keymap.set('n', '<leader><S-tab>', ':bprevious<CR>', With_desc("Previous buffer", opts))

