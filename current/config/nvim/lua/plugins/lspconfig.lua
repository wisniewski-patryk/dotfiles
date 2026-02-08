vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

local shared = require("lsp.shared")

vim.lsp.config("*", {
    capabilities = shared.capabilities,
})

vim.lsp.config.lua_ls = {
    on_attach = shared.on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } }
        }
    }
}

vim.lsp.enable({ "lua_ls" }) -- add more lsp ts, python etc.