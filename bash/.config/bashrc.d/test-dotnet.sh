#!/bin/bash

# Function: test-dotnet
# Description:
#   A wrapper around the 'dotnet test' command.
#   It automatically appends the filter '--filter "Category!=IntegrationTest"'
#   to exclude tests marked with the 'IntegrationTest' category.
#
# Usage:
#   test-dotnet <path_to_solution_or_project> [optional_dotnet_test_arguments]
#
# Arguments:
#   $1 (Mandatory): The path to the solution (.sln), solution filter (.slnf), 
#                   or project (.csproj) file you want to test.
#   $@ (Optional): Any additional arguments you would normally pass to 'dotnet test'.
#                  These will be appended after the exclusion filter.
#
# Example (using a solution filter):
#   test-dotnet MySolution.slnf --nologo --verbosity normal

function test-dotnet() {
    # Check if a path argument was provided
    if [ -z "$1" ]; then
        echo "Error: You must provide the path to the solution or project file." >&2
        echo "Usage: test-dotnet <path_to_sln_or_project> [optional_arguments]" >&2
        return 1
    fi

    # The required path argument is the first argument ($1)
    local path_arg="$1"

    # All arguments starting from the second one are optional additional arguments
    # Shift removes the first argument ($1) from the list of positional parameters ($@)
    shift 

    # Define the mandatory filter argument
    local filter_arg='--filter "Category!=IntegrationTest"'

    echo "Running command:"
    echo "    dotnet test \"${path_arg}\" ${filter_arg} $@"
    echo "----------------------------------------------------------------------"

    # Execute the command:
    # 1. 'dotnet test' command
    # 2. "${path_arg}": The required path argument (enclosed in quotes for paths with spaces)
    # 3. ${filter_arg}: The mandatory exclusion filter
    # 4. "$@": All remaining optional arguments passed by the user (e.g., --nologo)
    
    # Note: We use 'eval' here because the filter_arg contains quotes that must be 
    # interpreted correctly by the shell when executing 'dotnet test'.
    # If the filter was a simple string without internal quotes, 'eval' would not be needed.
    eval dotnet test "\"${path_arg}\"" ${filter_arg} "$@"
}

# The function definition ends here.

# To use this function:
# 1. Open your terminal configuration file (e.g., ~/.bashrc or ~/.zshrc).
# 2. Copy the entire 'function test-dotnet() { ... }' block into that file.
# 3. Reload your shell configuration: source ~/.bashrc 
# 4. Then you can use it like: test-dotnet MySolution.slnf
