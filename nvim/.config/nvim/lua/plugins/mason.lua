vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" }
})

require("mason").setup({
    max_concurrent_installers = 4,
    registries = {
        "github:Crashdummyy/mason-registry",
        "github:mason-org/mason-registry",
    },
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded", -- Defaults to `:h 'winborder'` if nil.
        backdrop = 60,
        width = 0.8,
        height = 0.9,
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
            toggle_package_install_log = "<CR>",
            toggle_help = "g?",
        },
    }
})

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH -- add path to mason folder to PATH
