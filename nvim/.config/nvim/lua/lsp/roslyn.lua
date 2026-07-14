local shared = require("lsp.shared")

vim.lsp.config("roslyn_ls", {
    on_attach = shared.on_attach,
    cmd = { "roslyn-language-server", "--stdio" },
    filetypes = { "razor", "cs" },
})

vim.lsp.enable("roslyn_ls")

