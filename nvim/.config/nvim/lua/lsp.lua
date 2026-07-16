print("Loading lsps and lspconfig plugin")

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" }
})

-- Load shared first so others can use it
local shared = require("lsp.shared")

vim.lsp.config("*", {
    capabilities = shared.capabilities,
})

require("lsp.lua")
require("lsp.rust")
require("lsp.zig")
require("lsp.typescript")
require("lsp.angular")
require("lsp.roslyn")

vim.lsp.inlay_hint.enable(true)
