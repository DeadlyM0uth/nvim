require("config.lazy")
require("config.mappings")
require("config.opts")
require("config.diagnostics")

vim.lsp.enable({
  "luals",
  "pyright",
  "gopls",
  "typescript-language-server",
})

