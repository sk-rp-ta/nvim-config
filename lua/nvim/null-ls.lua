local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local status_ok, configs = pcall(require, "null-ls")

if not status_ok then
    vim.notify("Check file null-ls.lua", "error", {title= "Could not load null-ls"}) 
end

configs.setup({
	sources = {
		configs.builtins.formatting.clang_format,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({bufnr = bufnr, async = false})
				end,
			})
		end
	end,
})
