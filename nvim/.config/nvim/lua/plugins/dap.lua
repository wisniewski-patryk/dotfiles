-- Debug Adapter Protocol

vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/nvim-neotest/nvim-nio" }, -- Required dependency for modern nvim-dap-ui
})

local dap = require("dap")
local dapui = require("dapui")

-- 1. Setup UI Layouts
dapui.setup()
-- Auto-open/close visual panels when debugging hooks start/end
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

-- 2. Define the coreclr adapter pointing to Mason's path
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"
local netcoredbg_cmd = mason_bin .. (vim.fn.has("win32") == 1 and "netcoredbg.exe" or "netcoredbg")

dap.adapters.coreclr = {
    type = "executable",
    command = netcoredbg_cmd,
    args = { "--interpreter=vscode" },
}

-- 3. C# Debugging Configurations
dap.configurations.cs = {
    {
        type = "coreclr",
        name = "Attach to Running .NET Process",
        request = "attach",
        processId = function()
            return require("dap.utils").pick_process()
        end,
    }
}

-- 4. Keymaps for Debugger Operations
local opts = { silent = true }
vim.keymap.set("n", "<leader><F5>",  dap.continue,  With_desc("Debug: Start/Continue", opts))
vim.keymap.set("n", "<leader><F10>", dap.step_over, With_desc("Debug: Step over", opts))
vim.keymap.set("n", "<leader><F11>", dap.step_into, With_desc("Debug: Step into", opts))
vim.keymap.set("n", "<leader><F12>", dap.step_out,  With_desc("Debug: Step out", opts))
vim.keymap.set("n", "<leader><F9>",  dap.toggle_breakpoint, With_desc("Debug: Toggle breakpoint", opts))
vim.keymap.set("n", "<leader>d<F9>", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, With_desc("Debug: Toggle condition breakpoint", opts))
vim.keymap.set("n", "<leader>dr",    dap.repl.open, With_desc("Debug: Open repl", opts))
vim.keymap.set('n', "<leader>d<CR>", function() dapui.float_element("scopes") end, With_desc("Debug: Toggle floating window"))
vim.keymap.set('n', "<leader>do",    dapui.open,    With_desc("Debug: Open UI"))
vim.keymap.set('n', "<leader>dc",    dapui.close,   With_desc("Debug: Close UI"))
vim.keymap.set('n', "<leader>dt",    dapui.toggle,  With_desc("Debug: Toggle UI"))
vim.keymap.set('n', "<leader>dd",    dap.terminate, With_desc("Debug: Stop debug"))

