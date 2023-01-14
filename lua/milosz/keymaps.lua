local options = {noremap = true}

local keymap = vim.api.nvim_set_keymap

keymap("n", "<A-Tab>", ":NvimTreeToggle<CR>", options)
