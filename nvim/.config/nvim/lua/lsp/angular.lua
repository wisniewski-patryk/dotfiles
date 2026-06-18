local shared = require("lsp.shared")

vim.lsp.config.angularls = {
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
  -- AngularLS often requires explicitly defining root markers to activate properly
  root_dir = require('lspconfig.util').root_pattern('angular.json', 'project.json', 'package.json'),
}

vim.lsp.enable({ "angularls" })
