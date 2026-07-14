print("Loading keybindings")

print("Mapping leader")
vim.g.mapleader = " "

print("Add Config reloading")
local function reloadConfig()
    vim.cmd("source $MYVIMRC")
    print("Config reloaded!")
end
vim.keymap.set("n", "<leader><leader>r", reloadConfig, { desc = "Reload Config" })

vim.keymap.set('n', '<leader><tab>', ':bnext<CR>', { desc = "Next buffer", silent = true })
vim.keymap.set('n', '<leader><S-tab>', ':bprevious<CR>', { desc = "Previous buffer", silent = true })




