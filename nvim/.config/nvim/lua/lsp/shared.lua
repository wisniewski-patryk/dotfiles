local M = {}

-- 1. Define your Keybindings here
M.on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, With_desc("LSP: Go to definition", opts))
    vim.keymap.set("n", "gK", function() vim.lsp.buf.hover() end, With_desc("LSP: Hover documentations", opts))
    vim.keymap.set("n", "gra", function() vim.lsp.buf.code_action() end, With_desc("LSP: Code action", opts))
    vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, With_desc("LSP: References", opts))
    vim.keymap.set("n", "grn",function()  vim.lsp.buf.rename() end, With_desc("LSP: Rename symbol", opts))
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, With_desc("LSP: Workspace symbol", opts))
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, With_desc("LSP: Open diagnostic float", opts))
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, With_desc("LSP: Next diagnostic", opts))
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, With_desc("LSP: Previous diagnostic", opts))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, With_desc("LSP: Signature help", opts))
end

-- 2. Define Capabilities (Autocomplete support)
local status_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp then
    M.capabilities = cmp_lsp.default_capabilities()
else
    M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

return M
