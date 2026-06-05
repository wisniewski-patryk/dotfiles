vim.pack.add({
    { src = "https://github.com/seblyng/roslyn.nvim" }
})

local roslyn = require("roslyn")
local shared = require("lsp.shared")

roslyn.setup({
    -- If 'dotnet' is in your PATH, this usually works. 
    -- If not, use the full path to Microsoft.CodeAnalysis.LanguageServer.dll
    -- path to vscode analiser $HOME/.vscode/extensions/ms-dotnettools.csharp-2.113.22-linux-x64/.roslyn/Microsoft.CodeAnalysis.LanguageServer
    exe = 'Microsoft.CodeAnalysis.LanguageServer',
    args = {
        '--logLevel=Information',
        '--extensionLogDirectory=' .. '/home/patryk/.logs/lsp/roslyn/',
    },
    config = {
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        settings = {
            ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution",
            },
        },
    },
})
