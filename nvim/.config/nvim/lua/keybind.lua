print("Loading keybindings")

print("Mapping leader")
vim.g.mapleader = " "

print("Add Explore")
vim.keymap.set('n', '<leader>e', vim.cmd.Explore, { desc = "Explore"})

print("Add Config reloading")
vim.keymap.set("n", "<leader><leader>r", function()
    vim.cmd("source $MYVIMRC")
    print("Config reloaded!")
end, { desc = "Reload Config" })
