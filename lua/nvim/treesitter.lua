local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    vim.notify("Check file treesitter.lua", "error" , {title=" Could not load treesitter"})
    return
end

configs.setup {
	ensure_installed = {"cpp", "python"},
	sync_install = false,
	ignore_install = {""},
	highlight = {
		enable = true,
		disable = {""},
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
}


