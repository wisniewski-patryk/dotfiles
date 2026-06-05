local M = {}

-- 1. Define your Keybindings here
M.on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
end

-- 2. Define Capabilities (Autocomplete support)
local status_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp then
    M.capabilities = cmp_lsp.default_capabilities()
else
    M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

return M