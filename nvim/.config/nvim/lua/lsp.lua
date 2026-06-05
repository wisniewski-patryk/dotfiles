print("Loading lsps and lspconfig plugin")

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" }
})

-- Load shared first so others can use it
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

vim.lsp.config.zls = {
    on_attach = shared.on_attach,
    settings = {
        zls = {
            semantic_tokens = "partial",
        }
    }
}

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

vim.lsp.enable({
    "lua_ls",       -- lua
    "zls",          -- zig
    "rust_analyzer" -- rust
}) -- add more lsp ts, python etc.

-- load roslyn LSP
require("lsp.roslyn")
