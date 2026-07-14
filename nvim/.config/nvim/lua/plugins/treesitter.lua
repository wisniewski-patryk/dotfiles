print("Loading plugin treesitter")
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" }
})

local ts = require('nvim-treesitter')

ts.setup {
  parser_install_dir = vim.fn.expand("~/.local/share/nvim/site"),
  highlight = {
      enable = true,
  }
}

print("Ensuring needed treesitters are installed")
local ensure_installed = {
    "c_sharp",
    "razor",
    "lua",
    "vim",
    "vimdoc",
    "markdown",
    "rust",
    "zig",
    "bash",
    "html",
    "css",
    "typescript",
    "javascript"
}

local installed = ts.get_installed()
for _, lang in ipairs(ensure_installed) do
  if not vim.list_contains(installed, lang) then
    ts.install(lang)
  end
end

-- 3. Enable Highlighting and Indentation
-- We use an autocommand to trigger Tree-sitter when opening C# files
local function startTreeSitter()
    vim.treesitter.start()
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs" }, -- filetype for C#
  callback = startTreeSitter
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "md" },
    callback = startTreeSitter
})
