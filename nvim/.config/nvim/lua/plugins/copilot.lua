print("Loading Copilot plugins")

vim.pack.add({
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/zbirenbaum/copilot-cmp" },
    { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
})

-- 1. Initialize core Copilot engine
require("copilot").setup({
    suggestion = {
        enabled = false, -- Disabled so ghost text doesn't clash with completion popup & NES
    },
    panel = { enabled = false },
})

-- 2. Initialize the nvim-cmp bridge
require("copilot_cmp").setup()

-- 3. Initialize Next Edit Suggestions (copilot-lsp)
-- require("copilot-lsp").setup({
--     nes = {
--         move_count_threshold = 3, -- Clears NES preview after 3 cursor movements
--     },
-- })
-- if installing LSP copilot-language-server will thorw error 'UNABLE_TO_RESOLVE_SSL' or somthing like that disable ssl for instalation time:
-- in neovim use command `!npm config set strict-ssl false` -> ! will run command in termina
-- next to install `:MasonInstall copilot-language-server

-- Enable copilot_ls in Neovim's built-in LSP client
vim.lsp.enable("copilot_ls")

-- Jump to/Apply Next Edit Suggestion using <M-l> (Alt+l)
vim.keymap.set({ "n", "i" }, "<M-l>", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local state = vim.b[bufnr].nes_state

    if state then
        local nes = require("copilot-lsp.nes")
        return nes.walk_cursor_start_edit() or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
    end
end, With_desc("Copilot: Apply / Jump to Next Edit Suggestion", {}))

-- Dismiss NES preview on <Esc>
vim.keymap.set("n", "<Esc>", function()
    if not require("copilot-lsp.nes").clear() then
        vim.cmd("noh")
    end
end, With_desc("Clear NES or search highlight", {}))
