
local shared = require("lsp.shared")

vim.pack.add({
    { src = "https://github.com/seblyng/roslyn.nvim" }
})

local roslyn_binary = vim.fn.stdpath("data") .. "/mason/bin/roslyn"
function on_init(client, initialize_result)
    if client.config.settings and client.config.settings.cmd_env then
        client.config.settings.cmd_env.TMPDIR = "/tmp"
    end
    if client.config.cmd_env then
        client.config.cmd_env.TMPDIR = "/tmp"
    end
    return true
end
require("roslyn").setup({
    config = {
        cmd = {
            roslyn_binary,
            "--logLevel=Information",
            "--stdio",
        },
        on_init = on_init,
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        env = {
            TMPDIR = "/tmp"
        },
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
