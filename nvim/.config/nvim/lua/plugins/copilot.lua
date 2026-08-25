print("Loading Copilot plugins")

vim.pack.add({
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/zbirenbaum/copilot-cmp" },
    { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
})


local copilot_initialized = false

-- Function to initialize and enable Copilot LSP on demand
local function start_copilot()
    if copilot_initialized then
        -- If already initialized, just ensure the server is attached/started for the active buffer
        vim.cmd("LspStart copilot_ls")
        print("Copilot LSP attached to buffer.")
        return
    end

    -- 1. Initialize base engine
    require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })

    -- 2. Initialize completion bridge & Next Edit Suggestions
    require("copilot_cmp").setup()
    require("copilot-lsp").setup({
        nes = { move_count_threshold = 3 },
    })

    -- 3. Enable for Neovim LSP client and start server
    vim.lsp.enable("copilot_ls")
    vim.cmd("LspStart copilot_ls")

    copilot_initialized = true
    print("GitHub Copilot LSP initialized and started!")

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
end

vim.api.nvim_create_user_command("CopilotStart", start_copilot, { desc = "Start Copilot LSP on demand" })

vim.keymap.set("n", "<leader>cs", function()
    start_copilot()
end, With_desc(" Copilot: Start LSP on demand", {}))

vim.keymap.set("n", "<leader>cq", function()
    vim.cmd("LspStop copilot_ls")
    print("Copilot LSP stopped.")
end, With_desc(" Copilot: Stop LSP server", {}))


