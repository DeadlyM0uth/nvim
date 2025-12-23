require("config.lazy")
require("config.mappings")
require("config.opts")
require("config.diagnostics")

-- Enable syntax highlighting for PlantUML files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.puml", "*.plantuml", "*.iuml"},
    command = "set filetype=plantuml"
})

vim.lsp.enable({
  "luals",
  "pyright",
  "gopls",
  "ts_ls",
  "bashls",
  "html",
})

