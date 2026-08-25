print("Loading plugins completion with lsp")

vim.pack.add({
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help" },
    { src = "https://github.com/onsails/lspkind.nvim" }
})

local cmp = require('cmp')
local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            symbol_map = { Copilot = "" },
        }),
        fields = {
            "icon",
            "abbr",
            "menu",
            "kind"
        },
        mode = "symbol_text",
        menu = ({
            buffer = "[Buffer]",
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
            path = "[Path]",
            nvim_lsp_signature_help = "[Sig]",
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'nvim_lsp', group_index = 2  },
        { name = 'buffer', group_index = 2 },
        { name = 'path', group_index = 2 },
        { name = 'nvim_lsp_signature_help', group_index = 2  },
    }),
})
