local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("nvim.lsp.handlers").on_attach,
		capabilities = require("nvim.lsp.handlers").capabilities,
	}

	 if server.name == "clangd" then
	 	local cpp_opts = require("nvim.lsp.settings.clangd")
	 	opts = vim.tbl_deep_extend("force", cpp_opts, opts)
	 end

	 if server.name == "pywright" then
	 	local python_opts = require("nvim.lsp.settings.pywright")

	server:setup(opts)
end)

