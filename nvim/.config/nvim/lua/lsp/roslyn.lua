local shared = require("lsp.shared")

vim.pack.add({
    { src = "https://github.com/seblyng/roslyn.nvim" }
})

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/roslyn"

require("roslyn").setup({
    exe = mason_bin,
    args = {
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
    },
    config = {
        on_attach = shared.on_attach,
        capabilities = shared.capabilities, -- Hooked into cmp-nvim autocompletion
        settings = {
            ["csharp"] = {
                enable_inlay_hints_for_implicit_variable_types = true,
                enable_inlay_hints_for_types = true,
            },
        },
    },
})

vim.filetype.add({
    extension = {
        cshtml = "razor",
        razor = "razor",
    },
})
