require("vim._core.ui2").enable({})

local nvim_version = vim.version()

if nvim_version.major == 0 and nvim_version.minor == 12 then 
    require("options")
    require("keybind")
    require("plugins")
    require("lsp")
    require("diagnostic")

    vim.keymap.set("n", "<leader><leader>r", function()
        vim.cmd("source $MYVIMRC")
        print("Config reloaded!")
    end, { desc = "Reload Config" })
else 
    print("it is not 0.12")
end

