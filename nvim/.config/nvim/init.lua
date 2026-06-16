local nvim_version = vim.version()

if nvim_version.major == 0 and nvim_version.minor >= 12 then
    print("It's minimum Neovim 0.12")
    require("vim._core.ui2").enable({})
    require("options") -- stuff like line numbers etc
    require("keybind") -- custom keybindings, define leader etc
    require("plugins")
    require("lsp")
    require("diagnostic")
else
    print("It is not Neovim 0.12")
end

