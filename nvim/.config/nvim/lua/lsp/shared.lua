local M = {}

-- 1. Define your Keybindings here
M.on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local function with_desc(description)
        return vim.tbl_deep_extend("force", opts or {}, { desc = description })
    end
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,                with_desc("LSP: Go to definition"))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,                      with_desc("LSP: Hover documentations"))
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, with_desc("LSP: Workspace symbol"))
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,     with_desc("LSP: Open diagnostic float"))
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,              with_desc("LSP: Next diagnostic"))
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,              with_desc("LSP: Previous diagnostic"))
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,      with_desc("LSP: Code action"))
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,       with_desc("LSP: References"))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,           with_desc("LSP: Rename symbol"))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,         with_desc("LSP: Signature help"))
end

-- 2. Define Capabilities (Autocomplete support)
local status_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp then
    M.capabilities = cmp_lsp.default_capabilities()
else
    M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

return M
