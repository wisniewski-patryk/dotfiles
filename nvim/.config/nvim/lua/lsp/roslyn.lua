local shared = require("lsp.shared")

vim.pack.add({
    { src = "https://github.com/seblyng/roslyn.nvim" }
})

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/roslyn"

local function checkLeakingNulls(client, _)
    -- 1. Scan for Neovim's internal null objects leaked into the environment
    if client.config.cmd_env then
        for key, val in pairs(client.config.cmd_env) do
            if val == vim.NIL or val == nil then
                client.config.cmd_env[key] = nil
            end
        end
    else
        client.config.cmd_env = {}
    end
    -- 2. Force assign standard system fallback paths for the server
    client.config.cmd_env.TMPDIR = vim.fn.getenv("TMPDIR") or vim.fn.getenv("TEMP") or "/tmp"
end

require("roslyn").setup({
    exe = mason_bin,
    args = {
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
    },
    filetype = { "cs", "cshtml", "razor" },
    config = {
        on_init = checkLeakingNulls,
        on_attach = shared.on_attach,
        capabilities = shared.capabilities, -- Hooked into cmp-nvim autocompletion
        settings = {
            ["csharp"] = {
                enable_inlay_hints_for_implicit_variable_types = true,
                enable_inlay_hints_for_types = true,
            },
            ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = true,
                dotnet_enable_tests_code_lens = true
            },
            ["csharp|completion"] = {
                dotnet_provide_regex_completions = false,
                dotnet_show_completion_items_from_unimported_namespaces = true,
                dotnet_show_name_completion_suggestions = true
            },
            ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = true,
                csharp_enable_inlay_hints_for_implicit_variable_types = true,
                csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                csharp_enable_inlay_hints_for_types = true,
                dotnet_enable_inlay_hints_for_indexer_parameters = true,
                dotnet_enable_inlay_hints_for_literal_parameters = true,
                dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                dotnet_enable_inlay_hints_for_other_parameters = true,
                dotnet_enable_inlay_hints_for_parameters = true,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true
            },
            ["csharp|symbol_search"] = {
                dotnet_search_reference_assemblies = true,
            },
            ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution"
            },
            ["csharp|formatting"] = {
                dotnet_organize_imports_on_format = true
            }
        },
    },
})

vim.filetype.add({
    extension = {
        cshtml = "razor",
        razor = "razor",
    },
})

-- vim.lsp.inlay_hints.enable()
