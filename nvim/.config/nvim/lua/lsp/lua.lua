local shared = require("lsp.shared")

vim.lsp.config.lua_ls = {
    on_attach = shared.on_attach,
    capabilities = shared.capabilities,
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            diagnostics = { globals = { 'vim' } }
        }
    }
}

vim.lsp.enable({ "lua_ls" })
