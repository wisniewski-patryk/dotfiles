-- Load shared first so others can use it
require("lsp.shared") 

-- Load Roslyn (C#)
require("lsp.roslyn")
-- Load Bash Lsp
require("lsp.bash")
-- Load Zig Lsp
require("lsp.zig")

-- Note: lspconfig is handled in your plugins/lspconfig.lua
