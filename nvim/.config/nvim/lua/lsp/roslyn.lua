local shared = require("lsp.shared")

vim.lsp.config("roslyn_ls", {
    on_attach = shared.on_attach,
    cmd = { "roslyn-language-server", "--stdio" },
    filetypes = { "razor", "cs", "cshtml" },
    settings = {
        ['csharp|background_analysis'] = {
            dotnet_analyzer_diagnostics_scope = 'openFiles',
            dotnet_compiler_diagnostics_scope = 'openFiles',
        },
    }
})

vim.lsp.enable("roslyn_ls")

