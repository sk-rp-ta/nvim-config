local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "milosz.lsp.mason"
require("milosz.lsp.handlers").setup()
