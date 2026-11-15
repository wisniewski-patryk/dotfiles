local shared = require("lsp.shared")
vim.pack.add({
    { src = "https://github.com/S1M0N38/love2d.nvim" }
})

require("love2d").setup({
    path_to_love_bin = "love",
})

vim.lsp.config.lua_ls = {
    on_attach = shared.on_attach,
    capabilities = shared.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'love' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            }
        }
    }

vim.lsp.enable({ "lua_ls" })
