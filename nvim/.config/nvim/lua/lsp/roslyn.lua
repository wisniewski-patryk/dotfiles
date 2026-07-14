
vim.lsp.config("roslyn_ls", {
    cmd = { "roslyn-language-server", "--stdio" },
    filetypes = { "razor", "cs" },
})

vim.lsp.enable("roslyn_ls")

