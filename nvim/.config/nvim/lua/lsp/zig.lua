local shared = require("lsp.shared")
vim.lsp.config.zls = {
    on_attach = shared.on_attach,
    settings = {
        zls = {
            semantic_tokens = "partial",
        }
    }
}

vim.lsp.enable({ "zls" })
