-- change default tab to 4
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- global lualine for all buffers
vim.opt.laststatus = 3

-- faster reload
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 2000

-- line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- rulers
vim.opt.colorcolumn = "80";

-- notifications
vim.notify = require("notify")

