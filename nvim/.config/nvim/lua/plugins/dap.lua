-- Debug Adapter Protocol

vim.pack.add({
  { src = "mfussenegger/nvim-dap" },
  { src = "rcarriga/nvim-dap-ui" },
  { src = "nvim-neotest/nvim-nio" }, -- Required dependency for modern nvim-dap-ui
})

local dap = require("dap")
local dapui = require("dapui")

-- 1. Setup UI Layouts
dapui.setup()
-- Auto-open/close visual panels when debugging hooks start/end
dap.listeners.before.attach.dapui_config = dapui.open()
dap.listeners.before.launch.dapui_config = dapui.open()
dap.listeners.before.event_terminated.dapui_config = dapui.close()
dap.listeners.before.event_exited.dapui_config = dapui.close()

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
    name = "Launch .NET App (Debug)",
    request = "launch",
    program = function()
      -- Prompt to find the compiled binary artifact (.dll)
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
    -- (Optional) If you want Neovim to build your project automatically right before hitting play:
    preLaunchTask = function()
      print("Building application...")
      vim.fn.system("dotnet build")
    end,
  },
}

-- 4. Keymaps for Debugger Operations
local opts = { silent = true }
vim.keymap.set("n", "<F5>", dap.continue, With_desc("Debug: Start/Continue", opts))
vim.keymap.set("n", "<F10>", dap.step_over, With_desc("Debug: Step over", opts))
vim.keymap.set("n", "<F11>", dap.step_into, With_desc("Debug: Step into", opts))
vim.keymap.set("n", "<F12>", dap.step_out, With_desc("Debug: Step out", opts))
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, With_desc("Debug: Toggle breakpoint", opts))
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, With_desc("Debug: Toggle condition breakpoint", opts))
vim.keymap.set("n", "<leader>dr", dap.repl.open, With_desc("Debug: Open repl", opts))

