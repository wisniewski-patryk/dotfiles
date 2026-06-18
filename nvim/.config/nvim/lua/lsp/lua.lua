local shared = require("lsp.shared")

vim.lsp.config.lua_ls = {
    on_attach = shared.on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } }
        }
    }
}

vim.lsp.enable({ "lua_ls" })
