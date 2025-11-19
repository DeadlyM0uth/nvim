require("config.lazy")
require("config.mappings")
require("config.opts")


vim.lsp.enable({
  "luals",
  "pyright",
  "gopls",
  "typescript-language-server",
})
