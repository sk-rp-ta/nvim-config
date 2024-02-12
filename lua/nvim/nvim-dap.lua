local dap_ok, dap = pcall(require, "dap")

if not dap_ok then
    vim.notify("Check file nvim-dap.lua", "error" , {title=" Could not load DAP"})
    return
end

local dap_ui_ok, dap_ui = pcall(require, "dapui")

if not dap_ui_ok then
    vim.notify("Check file nvim-dap.lua", "error" , {title=" Could not load DAP UI"})
    return
end

local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")

if not mason_dap_ok then
    vim.notify("Check file nvim-dap.lua", "error" , {title=" Could not load Mason DAP"})
    return
end

mason_dap.setup()
dap_ui.setup()

dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/bin/lldb-vscode',
    name = "lldb"
}

dap.configurations.cpp = {
    {
	name = "Launch",
	type = "lldb",
	request = "launch",
	program = function()
	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},
	runInTerminal = true,
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
end


dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
end


dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end
