print("Loading diagnostic settings")
vim.diagnostic.config({
    float = true,
    virtual_text = false,           -- Show errors at the end of the line
    signs = true,                  -- Show signs in the gutter (left side)
    underline = true,              -- Underline the actual code with the error
    update_in_insert = true,       -- Don't update while typing (waits for you to leave Insert mode)
    severity_sort = true,          -- Sort by severity (errors first)
    virtual_lines = false,
})

local opt = { noremap = true, silent = true }
vim.keymap.set('n', '<Tab>', function() vim.diagnostic.open_float() end, With_desc('Diagnostic window', opt))
