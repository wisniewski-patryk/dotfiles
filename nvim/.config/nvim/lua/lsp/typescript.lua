local shared = require("lsp.shared") -- Lua cleanly caches this import [cite: 13, 14]

vim.lsp.config.vtsls = {
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        variableTypes = { enabled = true },
      },
    },
  },
}

vim.lsp.enable({ "vtsls" })
