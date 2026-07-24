function With_desc(description, opts)
    return vim.tbl_deep_extend("force", opts or {}, { desc = description })
end
