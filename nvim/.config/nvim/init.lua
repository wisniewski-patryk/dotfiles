print("Loading UI 2.0")

require("vim._core.ui2").enable({})

local nvim_version = vim.version()

print("Checking Neovim version")
if nvim_version.major == 0 and nvim_version.minor == 12 then
    print("It is Neovim 0.12")
    require("options")
    require("keybind")
    require("plugins")
    require("lsp")
    require("diagnostic")

else
    print("It is not Neovim 0.12")
end

