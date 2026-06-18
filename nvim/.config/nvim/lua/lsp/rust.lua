local shared = require("lsp.shared")

vim.lsp.config.rust_analyzer = {
    on_attach = shared.on_attach,
    settings = {
        rust_analyzer = {
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        }
    },
}

vim.lsp.enable({ "rust_analyzer" })
