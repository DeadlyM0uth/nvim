require("config.lazy")
require("config.mappings")
require("config.opts")
require("config.diagnostics")


vim.lsp.enable({
  "luals",
  "pyright",
  "gopls",
  "ts_ls",
  "bashls",
  "html",
})

