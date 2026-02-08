vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" }
})

local ts = require('nvim-treesitter')

ts.setup {
  indent = {
    enable = true
  }
}

local ensure_installed = {
    "c_sharp",
    "lua",
    "vim",
    "vimdoc",
    "markdown"
}

local installed = ts.get_installed()
for _, lang in ipairs(ensure_installed) do
  if not vim.list_contains(installed, lang) then
    ts.install(lang)
  end
end

-- 3. Enable Highlighting and Indentation
-- We use an autocommand to trigger Tree-sitter when opening C# files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs" }, -- filetype for C#
  callback = function()
    -- Start Treesitter highlighting
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "md" },
    callback = function()
        vim.treesitter.start()
    end
})
