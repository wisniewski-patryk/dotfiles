print("Loading diagnostic settings")
vim.diagnostic.config({
    virtual_text = true,           -- Show errors at the end of the line
    signs = true,                  -- Show signs in the gutter (left side)
    underline = true,              -- Underline the actual code with the error
    update_in_insert = false,      -- Don't update while typing (waits for you to leave Insert mode)
    severity_sort = true,          -- Sort by severity (errors first)
})
