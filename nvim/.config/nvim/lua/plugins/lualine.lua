vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup({
    options = {
        theme = 'tokyonight',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
            -- LSP status indicator
            {
                function()
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #clients == 0 then
                        return ''
                    end
                    local names = {}
                    for _, client in ipairs(clients) do
                        table.insert(names, client.name)
                    end
                    return '󰒓 ' .. table.concat(names, ', ')
                end,
                color = { fg = '#00ff00' },
            },
            'encoding',
            'fileformat',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
})
